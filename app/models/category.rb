class Category < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  # scope :category_id, -> {  }

  scope :published, -> { where(published: true) }
end
