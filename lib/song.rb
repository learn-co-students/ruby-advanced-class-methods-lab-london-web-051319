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
    new_song = Song.new
    new_song.save
    new_song
  end 

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name 
    new_song
  end 

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save 
    new_song
  end

  def self.find_by_name(name)
    Song.all.each do |song| 
      if song.name == name
        return song
      end 
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else       
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|word|word.name}
  end

  def self.new_from_filename(song)
    new_song = Song.new
    song_split = song.split(" - ")
    new_song.artist_name = song_split[0]
    new_song.name = song_split[1].split('.mp3')[0].to_s
    new_song
  end

  def self.create_from_filename(song)
    new_song = Song.new
    song_split = song.split(" - ")
    new_song.artist_name = song_split[0]
    new_song.name = song_split[1].split('.mp3')[0].to_s
    new_song.save 
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
