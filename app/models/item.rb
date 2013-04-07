class Item < ActiveRecord::Base
  attr_accessible :description, :name, :release, :salesrank, :thumbnail_url, :album, :asin

  default_scope order('salesrank')

  def self.lookup(id)
    res = Amazon::Ecs.item_lookup(id, :response_group => 'ItemAttributes,Images,EditorialReview,SalesRank')
  end

end
