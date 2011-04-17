module BadFruit
  class Movie
    attr_accessor :id, :name, :cast, :scores, :posters

    def initialize(movieHash, badfruit)
      @id = movieHash["id"]
      @name = movieHash["title"]
      @cast = movieHash["abridged_cast"]
      @scores = Scores.new(movieHash["ratings"]) #single score object containing two scores
      @posters = Posters.new(movieHash["posters"]) #single posters object containing four poster urls
      @badfruit = badfruit
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
      return JSON.parse(@badfruit.get_movie_info(@id, "details"))
    end
  end
end