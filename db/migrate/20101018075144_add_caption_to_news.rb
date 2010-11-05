class AddCaptionToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :caption, :text
  end

  def self.down
    remove_column :news, :caption
  end
end
