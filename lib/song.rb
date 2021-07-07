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
    song = self.new
    song.name = name
    song.save
  end

  def self.find_by_name(name)
    self.all.find {|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    search = self.find_by_name(name)
    if search == nil
      self.create_by_name(name)
    else
      search
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(' - ')
    song = self.new
    song.artist_name = split_filename[0]
    song.name = split_filename[1].chomp!(".mp3")
    song
  end

  def self.create_from_filename(filename)
      self.new_from_filename(filename).save
    end

     def self.destroy_all
      @@all.clear
    end
end
