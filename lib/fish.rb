class Fish
  # code goes here
  attr_accessor :mood
  attr_reader :species, :name

  def initialize(name)
    @name = name
    @mood = "nervous"
  end
end
