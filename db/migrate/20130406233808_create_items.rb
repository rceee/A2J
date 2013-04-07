class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :salesrank
      t.text :description
      t.date :release

      t.timestamps
    end
  end
end
