class AddVisitorsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :visitors, :integer, default: 0
  end
end
