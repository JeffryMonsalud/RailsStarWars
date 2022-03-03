json.extract! film, :id, :title, :episode_id, :opening_crawl, :director, :producer, :release_date, :url, :created_at, :updated_at
json.url film_url(film, format: :json)
