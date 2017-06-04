class CreateMusics < ActiveRecord::Migration[5.0]
  def change
    create_table :musics do |t|
      t.string :song
      t.string :album
      t.string :band
      t.string :genre
      t.date :release

      t.timestamps
    end
  end
end
