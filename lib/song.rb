require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


  def save
    self.class.all << self
  end

  def self.create
    newSong = self.new
    self.all << newSong
    newSong
  end

  def self.new_by_name(name)
    newSong = self.new
    newSong.name = name
    newSong
  end

  def self.create_by_name(name)
    newSong = self.new
    newSong.name = name
    self.all << newSong
    newSong
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |word|
      word.name
    end
  end

  def self.new_from_filename(filename)
    newSong = self.new
    newSong.artist_name = filename.split(" - ")[0]
    newSong.name = filename.split(" - ")[1].split(".")[0]
    newSong
  end

  def self.create_from_filename(filename)
    newSong = self.new
    newSong.artist_name = filename.split(" - ")[0]
    newSong.name = filename.split(" - ")[1].split(".")[0]
    self.all << newSong
  end


  def self.destroy_all
    self.all.clear
  end

end
