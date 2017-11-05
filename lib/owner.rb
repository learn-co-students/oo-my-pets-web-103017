require "pry"

class Owner
  attr_reader :species, :pets
  attr_accessor :name

  @@all = []

  def initialize(name)
    @species = "human"
    @@all << self
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end



  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].collect {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].collect {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].collect {|fish| fish.mood = "happy"}
  end

  def pets=(hash)
    @pets=hash
  end

  def sell_pets
    @pets.collect do |type,pets|
      pets.each {|pet| pet.mood = "nervous"}
      pets.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end


end
