class Review
  attr_accessor :critic, :date, :publication, :quote, :links
  
  def initialize(reviewHash)
    @critic = reviewHash["critic"]
    @date = reviewHash["date"]
    @publication = reviewHash["publication"]
    @quote = reviewHash["quote"]
    @links = reviewHash["links"]
  end
end