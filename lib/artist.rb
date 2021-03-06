require 'pry'
class Artist
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

  def genres
    @songs.map(&:genre).uniq
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end