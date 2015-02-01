module BadFruit
  #
  # Class Movies provides an interface for accessing movie related tasks on the Rotton Tomatoes API.
  #
  class Movies
    # The maximum amount of object to return per page (A Rotten Tomatoes limitation)
    MAX_PAGE_LIMIT = 50

    #
    # Initialize a wrapper around the Rotten Tomatoes API specific to movies.
    # 
    def initialize(badfruit)
      @badfruit = badfruit
    end

    #
    # Search for a movie by name.
    #
    # @param [String] name The name of the movie to search for.
    # @param [Integer] page_limit The number of results to return for API response page. (Defaults to 1)
    # @param [Integer] page The page offset to request from the API. (Defaults to 1)
    #
    # @return [Array<BadFruit::Movie>] An array of movie objects matching the name parameter.
    # 
    def search_by_name(name, page_limit=1, page=1)
      if page_limit > 50
        page_limit = MAX_PAGE_LIMIT #current limitation of the rotten tomatos API
      end

      results_json = @badfruit.search_movies(name, page_limit, page)
      if results_json.nil?
        return []
      else
        return @badfruit.parse_movies_array(JSON.parse(results_json))
      end
    end

    # search by id

    #
    # Search for a movie by Rotten Tomatoes id.
    #
    # @param [String] movie_id The id of the movie to search for.
    #
    # @return [BadFruit::Movie] A movie object from the response data.
    # 
    def search_by_id(movie_id)
      movie = @badfruit.get_movie_info(movie_id, "main")
      raise 'Movie not found' if movie.nil? || movie.empty?
      @badfruit.parse_movie_array(JSON.parse(movie))
    end

    #
    # Search for a movie by way of a 3rd party id.
    #
    # @param [String] alias_id The alias id of the movie.
    # @param [String] type The type of alias id that is being provided. (Defaults to 'imdb')
    #
    # @return [BadFruit::Movie] A movie object representing the 3rd party id.
    # @note Currently only 'imdb' as a type is supported.
    # 
    def search_by_alias(alias_id, type='imdb')
      movie = @badfruit.get_movie_alias_info(alias_id, type)
      json = JSON.parse(movie)
      raise 'Movie not found' if !json['error'].nil?
      @badfruit.parse_movie_array(json)
    end

    #
    # Provide the similar movies for a given Rotten Tomatoes id.
    #
    # @param [String] movie_id The Rotten Tomatoes id for a given movie.
    #
    # @return [Array<BadFruit::Movie>] An array of movie objects similar to the input id.
    # 
    def similar_movies(movie_id)
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.similar_movies(movie_id)))
    end
  end
end
