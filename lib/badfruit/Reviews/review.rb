class Review
  attr_accessor :critic, :date, :publication, :quote, :links, :freshness
  
  def initialize(reviewHash)
    @critic = reviewHash["critic"]
    @date = reviewHash["date"]
    @publication = reviewHash["publication"]
    @quote = reviewHash["quote"]
    @links = reviewHash["links"]
    @freshness = reviewHash["freshness"]
  end
end