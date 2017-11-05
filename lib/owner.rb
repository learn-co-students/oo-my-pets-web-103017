require 'pry'
class Owner
  # code goes here
  @@all = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(name)
    @name = name
    @@all << self
    @species = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def self.all
    @@all
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
    # binding.pry
    @pets[:dogs].each{|x| x.mood="happy"}
  end

  def play_with_cats
    @pets[:cats].each{|x| x.mood="happy"}
  end

  def feed_fish
    @pets[:fishes].each{|x| x.mood="happy"}
  end

  def sell_pets
    @pets.each do |x,y|
      @pets[x].each{|z| z.mood="nervous"}
    end
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end


end
