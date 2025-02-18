class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    'I am a human.'
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{ |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select{ |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    my_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    my_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def pets
    self.cats + self.dogs
  end

  def sell_pets
    self.pets.each do |pet|
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end