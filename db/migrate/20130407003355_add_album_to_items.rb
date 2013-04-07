class AddAlbumToItems < ActiveRecord::Migration
  def change
    add_column :items, :album, :string
  end
end
