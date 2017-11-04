class Owner
  # code goes here

  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
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
    self.pets.collect do |animal, animal_array|
      animal_array.each do |pet|
        pet.mood = "nervous"
      end
      self.pets[animal] = []
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end
