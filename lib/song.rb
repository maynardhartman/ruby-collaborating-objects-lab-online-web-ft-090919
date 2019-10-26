class Song
  attr_accessor :name, :artist

  @@all = []
  @song = []
  
  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist_name, song_name, fluf = filename.split(" - ")
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
  end
  
  def self.all 
    @@all
  end
  
  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end
end