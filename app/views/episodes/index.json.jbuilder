json.array!(@episodes) do |episode|
  json.extract! episode, :id, :number, :season, :file
  json.url episode_url(episode, format: :json)
end
