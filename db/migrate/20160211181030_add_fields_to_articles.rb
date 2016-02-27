class AddFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :int
    add_column :articles, :rating, :int
  end
end
