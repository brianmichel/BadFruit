module BadFruit
  class Lists
    def initialize(badfruit)
      @badfruit = badfruit
    end

    def opening_movies
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("opening")))
    end
    
    def upcoming_movies
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("upcoming")))
    end
    
    def in_theaters
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("in_theaters")))
    end
    
    def new_dvd_releases
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("new_releases")))
    end
    
    def current_dvd_releases
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("current_releases")))
    end
  end
end
