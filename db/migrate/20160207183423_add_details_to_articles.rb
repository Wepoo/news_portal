class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text
    add_column :articles, :importance, :bool
  end
end
