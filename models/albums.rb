require ('pg')
require_relative('../db/sql_runner.rb')

class Album

attr_accessor :album_name, :album_genre
attr_reader :id, :artist_id



  def initialize(options)
    @id = options['id'].to_i if options['id']
    @album_name = options['album_name']
    @album_genre = options['album_genre']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (album_name, album_genre, artist_id)
    VALUES($1, $2, $3) RETURNING id"
    values = [@album_name, @album_genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map{|music| Album.new(music)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results.first
    artist = Artist.new(artist_data)
    return artist
  end

end
