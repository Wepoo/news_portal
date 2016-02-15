class ChangeArticlesRating < ActiveRecord::Migration
  change_column_default(:articles, :rating, 0)
end
