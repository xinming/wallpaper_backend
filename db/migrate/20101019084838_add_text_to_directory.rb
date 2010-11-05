class AddTextToDirectory < ActiveRecord::Migration
  def self.up
    add_column :directories, :text, :text
  end

  def self.down
    remove_column :directories, :text
  end
end
