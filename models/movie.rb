require('pg')
require_relative('../db/sql_runner')

class Movie
  attr_accessor :title, :genre, :rating
  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating'].to_i
  end

  def save()
    sql ="INSERT INTO movies (title, genre, rating)
    VALUES
    ($1,$2,$3)
    RETURNING id"
    values =[@title, @genre, @rating]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

    def self.delete_all()
      sql = "DELETE FROM movies"
      SqlRunner.run(sql)
    end

    def stars()
      sql = "SELECT stars.* FROM stars
      INNER JOIN castings ON castings.star_id = star_id
      WHERE movie_id = $1"
      values = [@id]
      stars = SqlRunner.run(sql,values)
      result = stars.map{|data|Star.new(data)}
      return result

    end
end
