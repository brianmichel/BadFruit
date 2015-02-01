module BadFruit
  #
  # Class Lists provides an interface for accessing list related tasks on the Rotton Tomatoes API.
  #
  class Lists
    #
    # Create a new instance of the Lists façade.
    #
    # @param [BadFruit::Base] badfruit An instance of the API client to use in subsequent calls.
    # 
    def initialize(badfruit)
      @badfruit = badfruit
    end

    #
    # Get a list of movies that are currently opening.
    #
    # @return [Array<BadFruit::Movie>] An array of movies that are currently opening.
    # 
    def opening_movies
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("opening")))
    end
    
    #
    # Get a list of movies that are coming up.
    #
    # @return [Array<BadFruit::Movie>] An array of movies that are coming up.
    # 
    def upcoming_movies
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("upcoming")))
    end
    
    #
    # Get a list of movies that are currently in theaters.
    #
    # @return [Array<BadFruit::Movie>] An array of movies that are currently in theaters.
    # 
    def in_theaters
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("in_theaters")))
    end
    
    #
    # Get a list of dvds that are about to come out/have come out.
    #
    # @return [Array<BadFruit::Movie>] An array of dvds that are about to come out/have come out.
    # 
    def new_dvd_releases
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("new_releases")))
    end
    
    #
    # Get a list of dvds that are currently out.
    #
    # @return [Array<BadFruit::Movie>] An array of dvds that are about currently out.
    # 
    def current_dvd_releases
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("current_releases")))
    end
    
    #
    # Get a list of dvds that are about to come out.
    #
    # @return [Array<BadFruit::Movie>] An array of dvds that are about to come out.
    # 
    def upcoming_dvd_releases
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("upcoming_dvds")))
    end

    #
    # Get a list of dvds that are currently the top rentals.
    #
    # @return [Array<BadFruit::Movie>] An array of dvds that are currently the top rentals.
    # 
    def top_rentals
      return @badfruit.parse_movies_array(JSON.parse(@badfruit.get_lists_action("top_rentals")))
    end
  end
end

