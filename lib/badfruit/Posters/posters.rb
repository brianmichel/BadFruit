module BadFruit
  #
  # Class Posters provides access to images urls that represent the movie poster in different sizes.
  #
  class Posters
    attr_reader :thumbnail, :profile, :detailed, :original
    #
    # Create a new posters object from a json response object.
    #
    # @param [Hash] posterHash The json response representing a review.
    # 
    def initialize(posterHash)
      @thumbnail = posterHash["thumbnail"]
      @profile = posterHash["profile"]
      @detailed = posterHash["detailed"]
      @original = posterHash["original"]
    end
  end
end
