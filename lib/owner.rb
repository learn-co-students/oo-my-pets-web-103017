require "pry"

class Owner

  attr_accessor :name, :pets
  attr_reader :species
  attr_writer :owners

  @@owners = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @@owners << self
  end

  #Class methods

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners = []
  end

  def self.count
    @@owners.length
    #binding.pry
  end

  #Instance Methods

  def species
    @species = 'human'
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    new_fish_instance = Fish.new(fish_name)
    self.pets[:fishes] << new_fish_instance
  end

  def buy_cat(cat_name)
    new_cat_instance = Cat.new(cat_name)
    self.pets[:cats] << new_cat_instance
  end

  def buy_dog(dog_name)
    new_dog_instance = Dog.new(dog_name)
    self.pets[:dogs] << new_dog_instance
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    @pets.each do |pet_type, pet_array|
      pet_array.each do |pet_instance|
        pet_instance.mood = 'nervous'
      end
      #binding.pry
    end
    @pets = {}
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end
