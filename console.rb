require('pry')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all()
Artist.delete_all()

artist_options_hash1 = {'name'=>'Amanda Palmer'}
artist1 = Artist.new(artist_options_hash1)
artist1.save()

artist_options_hash2 = {'name'=>'Beirut'}
artist2 = Artist.new(artist_options_hash2)


album_options_hash1 = {'title'=>'Who Killed Amanda Palmer', 'genre'=>'rock', 'artist_id'=>artist1.id}
album1 = Album.new(album_options_hash1)
album1.save()

album_options_hash2 = {'title'=>'Piano Is Evil', 'genre'=>'rock', 'artist_id'=>artist1.id}
album2 = Album.new(album_options_hash2)
album2.save()

album1.genre = 'alternative rock'
album1.update()

artist1.name = 'AFP'
artist1.update()

puts "List all albums:"
p Album.all()
puts ""
puts "List all artists:"
p Artist.all()
puts ""
puts "List all albums by Amanda Palmer:"
p artist1.get_albums()
puts ""
puts "List all albums by Beirut (there should be none):"
p artist2.get_albums()
puts ""
puts "Display the album's artist:"
p album2.get_artist()
puts ""
puts "Find album by id:"
p Album.find_by_id(1)
puts ""
puts "Find artist by id:"
p Artist.find_by_id(1)
puts ""
puts "Delete artist"
artist1.delete()
p Artist.all()
puts ""
puts "Delete one album:"
album1.delete()
p Album.all()
puts ""
puts "Delete second album:"
album2.delete()
p Album.all()
puts ""
puts "Delete artist:"
artist1.delete()
p Artist.all()
