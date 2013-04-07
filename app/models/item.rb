class Item < ActiveRecord::Base
  attr_accessible :description, :name, :release, :salesrank, :thumbnail_url

  def self.lookup(id)
    Amazon::Ecs.item_lookup(id, :response_group => 'ItemAttributes,Images,EditorialReview,SalesRank')
  end

end
