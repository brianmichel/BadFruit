module BadFruit
  #
  # Class Movie provides a model reprensentation of a movie object in the Rotten Tomatoes API.
  #
  class Movie
    #
    # @!attribute [rw] id
    #   @return [String] The Rotten Tomatoes id of the movie.
    attr_accessor :id
    #
    # @!attribute [rw] name
    #   @return [String] The name of the movie.
    attr_accessor :name
    #
    # @!attribute [rw] year
    #   @return [Integer] The year the movie was released.
    attr_accessor :year
    #
    # @!attribute [rw] genres
    #   @return [Array<String>] An array of genres.
    attr_accessor :genres
    #
    # @!attribute [rw] mpaa_rating
    #   @return [String] The MPAA rating for the movie.
    attr_accessor :mpaa_rating
    #
    # @!attribute [rw] runtime
    #   @return [Integer] The runtime of the movie in minutes.
    attr_accessor :runtime
    #
    # @!attribute [rw] release_dates
    #   @return [Hash<String : String>] A hash of release dates for the movie.
    attr_accessor :release_dates
    #
    # @!attribute [rw] synopsis
    #   @return [String] A brief summary of the movie plot.
    attr_accessor :synopsis
    #
    # @!attribute [rw] cast
    #   @return [Array<Hash>] An abridged array of raw actor hashes.
    attr_accessor :cast
    #
    # @!attribute [rw] directors
    #   @return [Array<Hash>] An abridged array of raw director hashes.
    attr_accessor :directors
    #
    # @!attribute [rw] scores
    #   @return [BadFruit::Scores] A scores object representing all of the numeric scores for a movie.
    attr_accessor :scores
    #
    # @!attribute [rw] posters
    #   @return [BadFruit::Posters] A posters object containing links to all various movie posters.
    attr_accessor :posters
    #
    # @!attribute [rw] links
    #   @return [Hash<String : String>] A hash of link keys to urls in other parts of the API
    attr_accessor :links

    #
    # Create a new Movie object from a given hash.
    #
    # @param [Hash] movieHash The movie hash from the server.
    # @param [BadFruit::Base] badfruit An instance of the Rotten Tomatoes API client.
    # 
    def initialize(movieHash, badfruit)
      @id = movieHash["id"]
      @name = movieHash["title"]
      @year = movieHash["year"]
      @genres = movieHash["genres"]
      @mpaa_rating = movieHash["mpaa_rating"]
      @runtime = movieHash["runtime"]
      @release_dates = movieHash["release_dates"]
      @synopsis = movieHash["synopsis"]
      @cast = movieHash["abridged_cast"]
      @directors = movieHash["abridged_directors"]
      @links = movieHash["links"]
      @scores = Scores.new(movieHash["ratings"]) #single score object containing two scores
      @posters = Posters.new(movieHash["posters"]) #single posters object containing four poster urls
      @badfruit = badfruit
      @moviehash = movieHash
    end
    
    #
    # Get the full cast for a movie.
    #
    # @return [Array<BadFruit::Actor>] A list of cast members in the movie.
    # 
    def full_cast
      return @badfruit.parse_actors_array(JSON.parse(@badfruit.get_movie_info(@id, "cast")))
    end

    #
    # Get all of the reivews for a movie.
    #
    # @return [Array<BadFruit::Review>] A list of review for the movie.
    # 
    def reviews
      data = JSON.parse(@badfruit.get_movie_info(@id, "reviews"))
      reviews = Array.new
      data["reviews"].each do |review|
        reviews.push(Review.new(review))
      end
       return reviews 
    end
  
    #
    # The raw JSON hash for the movie.
    #
    # @return [Hash] The raw JSON hash that was used to create the object.
    # 
    def info
      @moviehash
    end
  end
end

