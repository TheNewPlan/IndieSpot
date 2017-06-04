class AddAttachmentArtToMusics < ActiveRecord::Migration
  def self.up
    change_table :musics do |t|
      t.attachment :art
    end
  end

  def self.down
    remove_attachment :musics, :art
  end
end
