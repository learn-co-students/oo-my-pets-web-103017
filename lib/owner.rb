require 'pry'
class Owner
  # code goes here
  @@all = []

  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}

  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.count
  end

  def species
    @species
  end

  def say_species
    "I am a human."
  end

  def pets
    @pets
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
    self.pets[:dogs].each{|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each{|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each{|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets.each do |species, pets_list|
      pets_list.each do |pet|
        pet.mood = "nervous"
      end
      pets_list.clear
    end


  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end
