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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    @name = name
    song = self.new
    song.name = @name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do | song |
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
   @@all.sort_by do |i|
     i.name
   end
  end

  def self.new_from_filename(filename)
    a = filename.split(/ - /)
    @name = a[1].split(".").shift
    @artist_name = a[0]
    song = self.new
    song.name = @name
    song.artist_name = @artist_name
    song
  end

  def self.create_from_filename(filename)
  @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
