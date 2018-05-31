require('pry')
require_relative('models/star')
require_relative('models/movie')
require_relative('models/casting')

Casting.delete_all
Star.delete_all
Movie.delete_all

movie1 = Movie.new({
  'title' => 'Groundhog Day',
  'genre' => 'Comedy',
  'rating' => '8'
  })
  movie1.save

movie2 = Movie.new({
  'title' => 'Ghostbusters',
  'genre' => 'Comedy',
  'rating' => '7'
  })
  movie2.save

star1 = Star.new ({
  'first_name' => 'Bill',
  'last_name' => 'Murray'
  })
  star1.save

star2 = Star.new ({
  'first_name' => 'Andy',
  'last_name' => 'MacDowell'
  })
  star2.save

casting1 = Casting.new ({
  'movie_id' => movie1.id,
  'star_id' => star1.id,
  'fee' => '5'
  })
  casting1.save

casting2 = Casting.new ({
  'movie_id' => movie1.id,
  'star_id' => star2.id,
  'fee' => '2'
  })
  casting2.save

casting3 = Casting.new ({
  'movie_id' => movie2.id,
  'star_id' => star1.id,
  'fee' => '7'
  })
  casting3.save

binding.pry
nil
