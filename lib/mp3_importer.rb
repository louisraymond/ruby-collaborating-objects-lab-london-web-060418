class MP3Importer
  attr_accessor :filenames, :path, :artist

  def initialize(path)
    @path = path
    @filenames = []
  end

  def import
    files.each{|song_name| Song.new_by_filename(song_name)}
  end

  def files
    Dir.entries(path).each do |filename|
      @filenames << filename
    end
    @filenames.delete_if do |file|
      file == "." || file == ".."
    end
  end

end