class Item < ActiveRecord::Base
  attr_accessible :description, :name, :release, :salesrank, :thumbnail_url, :album, :asin

  validates_presence_of :asin

  def self.lookup(id)
    res = Amazon::Ecs.item_lookup(id, :response_group => 'ItemAttributes,Images,EditorialReview,SalesRank')
  end

end
