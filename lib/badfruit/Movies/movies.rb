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
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.search_movies(name, page_limit, page)))
    end

    # search by id
    def search_by_id(movie_id)
      movie = @badfruit.get_movie_info(movie_id, "main")
      raise 'Movie not found' if movie.blank?
      @badfruit.parse_movie_array(JSON.parse(movie))
    end
  end
end
