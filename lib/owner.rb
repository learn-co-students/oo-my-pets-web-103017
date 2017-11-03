require "pry"

class Owner
  attr_reader  :species
  attr_accessor :name, :pets


  @@all = []
  @@count =  0


  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs:[]}
    @@all << self
    @@count += 1
  end

  def self.count
    @@count
  end

  def self.all
    @@all
  end

  def self.reset_all
      @@count = 0
  end

  def say_species
    "I am a #{@species}."
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
    @pets[:dogs][0].mood="happy"
  end

  def play_with_cats
    @pets[:cats][0].mood="happy"
  end

  def feed_fish
    @pets[:fishes][0].mood="happy"
  end

  def sell_pets
    self.pets.each do |type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {}
  end

  def list_pets
    fishes = 0
    cats = 0
    dogs = 0
    self.pets.each do |species, pet|
      if species == :fishes
        fishes = pet.length
      elsif species == :cats
        cats = pet.length
      elsif species == :dogs
        dogs = pet.length
      end
    end
    return "I have #{fishes} fish, #{dogs} dog(s), and #{cats} cat(s)."
  end

end
