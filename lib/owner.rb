require 'pry'
class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@owners = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@owners << self
  end

  def self.all
    @@owners
  end
  def self.reset_all
    @@owners.clear
  end
  def self.count
    @@owners.count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(fish) #<:bubbles>
    # binding.pry
    self.pets[:fishes] << Fish.new(fish)
    # @pets[:fishes] << Fish.new(fish)
    # pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    self.pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    self.pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    # binding.pry
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |key, value|
      value.each { |pet| pet.mood = 'nervous' }
      value.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
