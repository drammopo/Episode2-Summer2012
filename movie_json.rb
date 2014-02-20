require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  begin
    puts "OH HAI. Add a movie you really like?"
    movie_title = gets
    movie = Api.search_by_title(movie_title)
    puts "Added: #{movie.title}. Score: #{movie.score}"
    puts "Average score for the year: #{Movie.average_rating}"
  rescue NoMethodError
    puts "Not found."
  end
end

find_movie
puts "The average rating for all movies searched is #{Movie.average_rating}."

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
    puts "Average score for the year: #{Movie.average_rating}"
  else
    break
  end
end
