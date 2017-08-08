require 'rest-client'
require 'json'
require 'pry'

  #make the web request
    # iterate over the character hash to find the collection of `films` for the given
  #   `character`
    # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film


def get_character_movies_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  film_description = nil
  films_hash = []
  character_hash["results"].each do |people|
    if people["name"] == character
      people["films"].each do |film|
        films_hash << film
      end
    end
  end
  films_hash
end

  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def parse_character_movies(films_hash)
  film_array = []
  films_hash.each do |film|
    unparsed = RestClient.get(film)
    parsed = JSON.parse(unparsed)
    film_array << parsed 
  end
  film_array
end



#runner method
def show_character_movies(character)
  titles = []
  films_hash = get_character_movies_from_api(character)
  parsed_hash = parse_character_movies(films_hash)
  parsed_hash.each do |hash|
    titles << hash["title"]
  end
  puts titles
end

## BONUS


# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
