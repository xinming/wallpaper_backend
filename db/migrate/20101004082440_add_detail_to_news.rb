class AddDetailToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :by, :text
    add_column :news, :subtitle, :text
    add_column :news, :metadata, :text
  end

  def self.down
    remove_column :news, :by
    remove_column :news, :subtitle
    remove_column :news, :metadata
  end
end
