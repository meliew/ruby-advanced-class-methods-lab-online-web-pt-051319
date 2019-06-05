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
    song.save
    song
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
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name }

  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end


  def self.alphabetical
    @@all.sort {|a, b| a.name <=> b.name}

  end

  def self.new_from_filename(filename)
    #remove .mp3
    song_array = filename.slice(0, filename.length-4).split(" - ")
    song = Song.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    #remove .mp3
    song_array = filename.slice(0, filename.length-4).split(" - ")
    song = Song.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
