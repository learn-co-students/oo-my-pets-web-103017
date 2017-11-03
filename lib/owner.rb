class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []
  
  def initialize(name, species="human")
    @name = name
    @pets = {
      fishes: [],
      cats: [],
      dogs:[]
    }
    @species = species
    @@all << self
  end

  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |species, pet_arr|
      pet_arr.map do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.map do |species, pet_arr|
      pet_arr.clear
    end
  end

  def list_pets
    pet_count = []
    @pets.map do |species, pet_arr|
      pet_count << "#{pet_arr.count}"
    end
    "I have #{pet_count[0]} fish, #{pet_count[2]} dog(s), and #{pet_count[1]} cat(s)."
  end

end













