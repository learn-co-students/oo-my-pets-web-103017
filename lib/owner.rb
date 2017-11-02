class Owner
  # code goes here
  @@all= []
  attr_accessor
  attr_reader

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species,name="")
    @species = species
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].collect{|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].collect{|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].collect{|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets[:dogs].collect{|dog| dog.mood = "nervous"}
    self.pets[:cats].collect{|cat| cat.mood = "nervous"}
    self.pets[:fishes].collect{|fish| fish.mood = "nervous"}
    self.pets[:dogs].clear
    self.pets[:cats].clear
    self.pets[:fishes].clear
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

end
