class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


def self.create(name)
     song = self.new
     song.name = name
     @@all << song
     self
   end

   def self.find_or_create_by_name
   end

end
