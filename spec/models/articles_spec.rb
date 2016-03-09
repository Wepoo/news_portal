require "rails_helper"
require "article"

RSpec.describe Article, :type => :model do 
  it 'changes the number of Articles' do
    article = Article.new
    expect { article.save }.to change { Article.count }.by(1)
  end

  it 'include tags' do
    tag1 = ActsAsTaggableOn::Tag.new(name: 'gift')
    tag2 = ActsAsTaggableOn::Tag.new(name: 'audi')
    article = Article.new(tag_list: [tag1, tag2])
    expect(article.tag_list).to include(tag1.name)
    expect(article.tag_list).to include(tag2.name)
  end
end