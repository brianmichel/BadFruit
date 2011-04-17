module BadFruit
  class Posters
    attr_reader :thumbnail, :profile, :detailed, :original
    def initialize(posterHash)
      @thumbnail = posterHash["thumbnail"]
      @profile = posterHash["profile"]
      @detailed = posterHash["detailed"]
      @original = posterHash["original"]
    end
  end
end