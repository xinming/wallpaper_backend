class AddNewCategoryIdToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :news_category_id, :integer
  end

  def self.down
    remove_column :news, :news_category_id
  end
end
