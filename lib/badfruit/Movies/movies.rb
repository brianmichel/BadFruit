module BadFruit
  class Movies
    MAX_PAGE_LIMIT = 50

    def initialize(badfruit)
      @badfruit = badfruit
    end

    #returns an array of movie objects from the given search result.
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
    def search_by_id(movie_id)
      movie = @badfruit.get_movie_info(movie_id, "main")
      raise 'Movie not found' if movie.nil? || movie.empty?
      @badfruit.parse_movie_array(JSON.parse(movie))
    end

    # search by alias (currently only IMDB is supported)
    def search_by_alias(alias_id,type='imdb')
      movie = @badfruit.get_movie_alias_info(alias_id, type)
      json = JSON.parse(movie)
      raise 'Movie not found' if !json['error'].nil?
      @badfruit.parse_movie_array(json)
    end

    # similar movie
    def similar_movies(movie_id)
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.similar_movies(movie_id)))
    end

  end
end
