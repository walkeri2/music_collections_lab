require('pry')
require_relative("models/albums.rb")
require_relative("models/artists.rb")

artist1 = Artist.new({'artist_name' => 'Bob'})
artist1.save()

album1 = Album.new({'album_name' => 'Legend', 'album_genre' => 'reggae', 'artist_id' => artist1.id})
album2 = Album.new({'album_name' => 'Catch a Fire', 'album_genre' => 'reggae', 'artist_id' => artist1.id})
album1.save()
album2.save()

binding.pry
artist1.albums
nil
