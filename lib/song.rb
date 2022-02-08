class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def self.create
    # create new instance of a song
    # save new instance in to array all
    # return new instance
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
    new_song = new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_name, name = filename.split(" - ")
    new_song = new_by_name(name.split(".")[0])
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    artist_name, name = filename.split(" - ")
    new_song = create_by_name(name.split(".")[0])
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

end
