require('pg')
require_relative('../db/sql_runner')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()

    sql = "INSERT INTO artists
            (name)
           VALUES
            ($1)
           RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map {|artist| Artist.new(artist)}
  end

  def update()
    sql = "UPDATE artists
            SET name = $1
            WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)

  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def get_albums()
    sql = "SELECT * FROM albums
           WHERE artist_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map {|album| Album.new(album)}
  end

  def delete()
     if get_albums().length != 0
       p "Cannot delete artist before removing all of their albums first"
       return
    end
      sql = "DELETE FROM artists
             WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists
           WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return nil if result.values.empty?
    return Artist.new(result[0])
  end


end
