class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []
  def initialize(name)

    @name = name
    @songs = []

  end
  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
      self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_name)
   genre = Genre.new(genre_name)
   genre.save
   genre
  end

  def artists
    songs.collect {|s| s.artist}.uniq
  end

end
