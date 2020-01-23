require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id, :artist_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_name = options['artist_name']
  end

  def save
    sql = "INSERT INTO artists (artist_name)
    VALUES($1) RETURNING id"
    values = [@artist_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{|person| Artist.new(person)}
  end

  # returns an array of album objects matching this object's artist id
  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    albums = results.map{|album| Album.new(album)}
    return albums
  end
end
