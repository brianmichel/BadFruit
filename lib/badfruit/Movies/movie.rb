module BadFruit
  class Movie
    attr_accessor :id, :name, :year, :genres, :mpaa_rating, :runtime, :release_dates,
                  :synopsis, :cast, :directors, :scores, :posters, :links

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
    
    #returns an array of Actor objects
    def full_cast
      return @badfruit.parse_actors_array(JSON.parse(@badfruit.get_movie_info(@id, "cast")))
    end

    #returns an array of Review objects
    def reviews
      data = JSON.parse(@badfruit.get_movie_info(@id, "reviews"))
      reviews = Array.new
      data["reviews"].each do |review|
        reviews.push(Review.new(review))
      end
       return reviews 
    end
  
    def info
      @moviehash
    end
  end
end
