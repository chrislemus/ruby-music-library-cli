class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def artists
    @songs.map(&:artist).uniq
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end