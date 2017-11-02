class Owner
  @@owners = []

  attr_accessor :name, :pets
  attr_reader :species
  def initialize(species)
    @@owners << self
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:"fishes"] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:"cats"] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:"dogs"] << dog
  end

  def walk_dogs
    @pets[:"dogs"].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:"cats"].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:"fishes"].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |type, pets|
      pets.each{|pet| pet.mood = "nervous"}
      pets.clear
    end
  end

  def list_pets
    "I have #{@pets[:"fishes"].size} fish, #{@pets[:"dogs"].size} dog(s), and #{@pets[:"cats"].size} cat(s)."
  end

end
