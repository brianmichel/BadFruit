class Director
  attr_accessor :name
  
  def initialize(directorHash)
    @name = directorHash["name"]
  end
end
