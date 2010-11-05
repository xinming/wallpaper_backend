class AddGalleryIdAndDescriptionToGalleryItem < ActiveRecord::Migration
  def self.up
    add_column :gallery_items, :gallery_id, :integer
    add_column :gallery_items, :description, :string
  end

  def self.down
    remove_column :gallery_items, :description
    remove_column :gallery_items, :gallery_id
  end
end
