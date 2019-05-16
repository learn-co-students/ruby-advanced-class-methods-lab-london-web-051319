class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name).save
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    finder = self.find_by_name(name)
    return finder if finder.nil? == false
    create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(title)
    deets = title.split(" - ")
    song = self.new
    song.artist_name, song.name = deets
    song.name.slice!(".mp3")
    song
  end

  def self.create_from_filename(title)
    self.new_from_filename(title).save
  end

  def self.destroy_all
    @@all = []
  end


end
