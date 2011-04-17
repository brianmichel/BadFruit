module BadFruit
  class Movie
    attr_accessor :id, :name, :cast, :scores, :posters

    def initialize(movieHash, badfruit)
      @id = movieHash["id"]
      @name = movieHash["title"]
      @cast = movieHash["abridged_cast"]
      @scores = movieHash["ratings"]
      @posters = Posters.new(movieHash["posters"])
      @badfruit = badfruit
    end

    def averageScores
      puts "average!"
    end
  
    # for the three following methods, pass in your BadFruit client instance to retreive the info
    # this will be fixed when all results are parsed into movie assets for the user
    def fullCast
      data = JSON.parse(@badfruit.get_movie_info(@id, "cast"))
      actors = Array.new
      data["cast"].each do |actor|
        actors.push(Actor.new(actor))
      end
      return actors
    end
  
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