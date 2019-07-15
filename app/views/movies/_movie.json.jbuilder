json.extract! movie, :id, :title, :year, :director, :category, :cla_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
