class Actor
  attr_accessor :name, :characters
  
  def initialize(actorHash)
    @name = actorHash["name"]
    @characters = actorHash["characters"]
  end
end