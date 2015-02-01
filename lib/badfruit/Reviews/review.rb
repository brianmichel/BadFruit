module BadFruit
  #
  # Class Review provides a model of the reviews that can come back in the API.
  #
  class Review
    #
    # @!attribute [rw] critic
    #   @return [String] The name of the critic who wrote the review.
    attr_accessor :critic
    #
    # @!attribute [rw] date
    #   @return [String] The date of the publication.
    attr_accessor :date
    #
    # @!attribute [rw] publication
    #   @return [String] The publication that published the review.
    attr_accessor :publication
    #
    # @!attribute [rw] quote
    #   @return [String] A quote from the review.
    attr_accessor :quote
    #
    # @!attribute [rw] links
    #   @return [Hash] A hash of different links to the review.
    attr_accessor :links
    #
    # @!attribute [rw] freshness
    #   @return [String] A string value describing the freshness of a review. (i.e. 'fresh', 'rotten')
    attr_accessor :freshness

    #
    # Create a new review object from a json response object.
    #
    # @param [Hash] reviewHash The json response representing a review.
    # 
    def initialize(reviewHash)
      @critic = reviewHash["critic"]
      @date = reviewHash["date"]
      @publication = reviewHash["publication"]
      @quote = reviewHash["quote"]
      @links = reviewHash["links"]
      @freshness = reviewHash["freshness"]
    end
  end
end

