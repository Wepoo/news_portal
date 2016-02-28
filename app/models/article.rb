class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :visits
  
  acts_as_commentable
  
  acts_as_votable
end
