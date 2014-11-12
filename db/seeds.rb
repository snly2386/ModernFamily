# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 1..24
	Episode.create({season: 1, number: i, file: "1-#{i}.mp4"})
end

for i in 1..24
	Episode.create({season: 2, number: i, file: "2-#{i}.mp4"})
end

for i in 1..24
	Episode.create({season: 3, number: i, file: "3-#{i}.mp4"})
end

for i in 1..24
	Episode.create({season: 4, number: i, file: "4-#{i}.mp4"})
end

for i in 1..25
	Episode.create({season: 5, number: i, file: "5-#{i}.mp4"})
end