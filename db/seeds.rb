# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

#This is the parsing for seeding music from the musicSeed.txt
csv_text = File.read('app/assets/musicSeed.txt')
csv_text = CSV.parse(csv_text, :headers => true, :col_sep => "\t")
csv_text.each do |row|
  Music.create(song: row[0], album: row[1], band: row[2], genre: row[3], release:row[4])
end

require 'csv'
REALM = "localhost"
#Below is the csv parsing for the users.
#Passwords are encrypted with the MD5 algorithm.
require 'digest/md5'
csv_text = File.read('app\assets\users.txt')
mycsv = CSV.parse(csv_text, :headers => true, :col_sep => "\t")
mycsv.each do |row|
  user = User.new
  user.username = row[0]
  user.password = password = Digest::MD5.hexdigest([row[0], REALM, row[1]].join(":"))
  user.email = row[2]
  user.preferences = row[3]
  user.save
  #User.create(username: row[0], password: password, email: row[2], preferences: row[3])
end