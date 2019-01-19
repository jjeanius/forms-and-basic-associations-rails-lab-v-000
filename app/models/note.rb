class Note < ActiveRecord::Base
  belongs_to :song

  def note_contents=(name)
    self.note_contents = Note.find_or_create_by(name: name)
  end

  def note_contents
    self.note_contents ? self.note_contents.name : nil
  end





end
