class Scores
  attr_reader :critics_score, :audience_score
  def initialize(scoreHash)
    @critics_score = scoreHash["critics_score"]
    @audience_score = scoreHash["audience_score"]
  end
  
  def average
    return ((@critics_score + @audience_score) / 2) #ultimate math skillz.
  end
end