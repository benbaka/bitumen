json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :summary, :body, :date_of_creation
  json.url blog_url(blog, format: :json)
end
