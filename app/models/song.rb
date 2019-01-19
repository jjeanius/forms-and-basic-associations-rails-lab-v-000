class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents
    self.note_contents ? self.note_contents : nil
  end

  def note_contents=(song_ids)
    song_ids.each do |song_id|
      note = Note.find(song_id)
      self.notes << note
    end
  end

end
