class Movie
  attr_accessor :id, :name, :cast, :scores

  def initialize(movieHash, badfruit)
    @id = movieHash["id"]
    @name = movieHash["title"]
    @cast = movieHash["abridged_cast"]
    @scores = movieHash["ratings"]
    @badfruit = badfruit
  end

  def averageScores
    puts "average!"
  end
  
  # for the three following methods, pass in your BadFruit client instance to retreive the info
  # this will be fixed when all results are parsed into movie assets for the user
  def fullCast
    return JSON.parse(@badfruit.get_movie_info(@id, "cast"))
  end
  
  def reviews
    return JSON.parse(@badfruit.get_movie_info(@id, "reviews"))
  end
  
  def info
    return JSON.parse(@badfruit.get_movie_info(@id, "details"))
  end
end