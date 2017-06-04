class Music < ApplicationRecord
  validates :album, presence: true
  validates :song, presence: true
  validates :band, presence: true
  validates :genre, presence: true
  validates :release, presence: true
end
