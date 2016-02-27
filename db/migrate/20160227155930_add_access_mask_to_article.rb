class AddAccessMaskToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :hidden, :boolean, default: false
    add_column :articles, :access_to_description, :boolean, default: true
  end
end
