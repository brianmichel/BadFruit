module BadFruit
  class Lists
    def initialize(badfruit)
      @badfruit = badfruit
    end

    def openingMovies
      return @badfruit.parseMoviesArray(JSON.parse(@badfruit.get_lists_action("opening")))
    end
    
    def upcomingMovies
      return @badfruit.parseMoviesArray(JSON.parse(@badfruit.get_lists_action("upcoming")))
    end
    
    def inTheaters
      return @badfruit.parseMoviesArray(JSON.parse(@badfruit.get_lists_action("in_theaters")))
    end
    
    def newDVDReleases
      return @badfruit.parseMoviesArray(JSON.parse(@badfruit.get_lists_action("new_releases")))
    end
  end
end