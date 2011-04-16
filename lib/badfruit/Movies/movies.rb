module BadFruit
  class Movies
    MAX_PAGE_LIMIT = 50
    
    def initialize(badfruit)
      @badfruit = badfruit
    end
    
    def search_by_name(name, page_limit=1, page=1)
      if page_limit > 50
        page_limit = MAX_PAGE_LIMIT #current limitation of the rotten tomatos API
      end
        JSON.parse(@badfruit.search_movies(name, page_limit, page))
    end
  end
end