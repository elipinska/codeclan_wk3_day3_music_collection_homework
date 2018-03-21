require('pry')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all()
Artist.delete_all()

artist_options_hash1 = {'name'=>'Amanda Palmer'}
artist1 = Artist.new(artist_options_hash1)
artist1.save()

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


p Album.all()
puts ""
p Artist.all()
puts ""
p artist1.get_albums()
puts ""
p album2.get_artist()

album1.delete()
p Album.all()
