json.array!(@articles) do |article|
  json.extract! article, :id, :title, :full_text
  json.url article_url(article, format: :json)
end
