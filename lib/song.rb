#require "pry"

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
    obj = self.new
    obj.save
    obj
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    @@all.find { |song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    val = self.find_by_name(title)

    if val
      val
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    str = filename.split(" - ")
    artist = str.first
    song_name = str.last.sub(".mp3", "")

    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    str = filename.split(" - ")
    artist = str.first
    song_name = str.last.sub(".mp3", "")

    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
