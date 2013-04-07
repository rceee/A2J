class ItemsController < ApplicationController

  def index
    @items = Item.all

    respond_to do |format|
      format.html
      format.json  { render :json => @items }
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create
    if params[:item][:asin].present? #make sure user submitted an ASIN
      asin = params[:item][:asin]
      az_connect #connect to Amazon
      res = Item.lookup(asin) #get our result

      if res.has_error?
        redirect_to new_item_path, :alert => "There was a problem with your entry.  Check the ASIN number and try again."
        return
      end

      res = res.items.first #call now intead of in model to preserve has_error? function
      @item.name = res.get('ItemAttributes/Artist').html_safe
      @item.album = res.get('ItemAttributes/Title').html_safe
      @item.thumbnail_url = res.get('MediumImage/URL')
      @item.release = res.get('ItemAttributes/ReleaseDate').html_safe
      @item.salesrank = res.get('SalesRank')
      @item.description = res.get('DetailPageURL')
      @item.asin = asin

      if @item.save!
        redirect_to @item, :notice => "Album #{@item.album} added to the database!  Thanks for keeping us up to date."
        return
      else
        redirect_to new_item_path, :alert => "There was a problem with your entry.  Check the ASIN number and try again."
      end
    else
      flash[:alert] = "Please enter a valid ASIN number."
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html
      format.json  { render :json => @item }
    end
  end

end

private

def az_connect
  Amazon::Ecs.options = {
     :associate_tag => ENV["ASSOCIATE_TAG"],
     :AWS_access_key_id => ENV["KEY_ID"],
     :AWS_secret_key => ENV["SECRET_KEY"]
   }
end
