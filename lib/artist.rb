class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.create_by_name(name)
      artist = self.new(name)
      artist.save
      artist
    end

    def self.find_by_name(name)
      self.all.detect do |artist|
        artist.name == name
      end
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
    end

    def add_song(song)
      song.artist = self
      @songs << song
    end

    def songs
      @songs.select do |song|
        song.artist == self
      end
    end

    def print_songs
      self.songs.each do |song|
        puts song.name
      end
    end

end