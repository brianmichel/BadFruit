module BadFruit
  #
  # Class Scores provides access to information regarding numerical scores for a movie.
  #
  class Scores
  attr_reader :critics_score, :audience_score
  #
  # Creates a new scores model object.
  #
  # @param [Hash] scoreHash A hash of scores returned from the server.
  # 
  def initialize(scoreHash)
    @critics_score = scoreHash["critics_score"]
    @audience_score = scoreHash["audience_score"]
  end
  
  #
  # Computes the average score for a movie based upon all stored values.
  #
  # @return [Float] The average score value for a movie.
  # 
  def average
    return ((@critics_score + @audience_score) / 2.0) #ultimate math skillz.
  end
  end
end

