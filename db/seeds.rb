# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Song.destroy_all
Artist.destroy_all

whitechapel = Artist.create!(name: 'Whitechapel')
belphegor = Artist.create!(name: 'Belphegor')
cannibal_corpse = Artist.create!(name: 'Cannibal Corpse')


whitechapel.songs.create!(title: 'This is Exile', length: 360, play_count: 2321)
whitechapel.songs.create!(title: 'Possession', length: 405, play_count: 4425)
whitechapel.songs.create!(title: 'Exalt', length: 120, play_count: 347)

belphegor.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
belphegor.songs.create!(title: 'Baphomet', length: 525, play_count: 999)

cannibal_corpse.songs.create!(title: 'Scourge of Iron', length: 419, play_count: 4572)
