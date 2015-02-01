module BadFruit
  #
  # Class Actor provides a model representation of an actor returned from the Rotten Tomatoes API.
  #
  class Actor
    #
    # @!attribute [rw] name
    #   @return [String] The name of the actor.
    attr_accessor :name
    #
    # @!attribute [rw] characters
    #   @return [Array<String>] An array of characters the actor has played in the movie.
    attr_accessor :characters

    #
    # Creates a new instance of a BadFruit::Actor
    #
    # @param [Hash] actorHash The hash representing the Actor model.
    # 
    def initialize(actorHash)
      @name = actorHash["name"]
      @characters = actorHash["characters"]
    end
  end
end

