# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'

BASE_URL = 'http://swapi.co/api/'

json = RestClient.get BASE_URL + 'films/'
films = JSON.parse json

films['results'].each do |f|
  film = Film.new
  film.director = f['director']
  film.episode_id = f['episode_id']
  film.opening_crawl = f['opening_crawl']
  film.producer = f['producer']
  film.release_date = f['release_date']
  film.title = f['title']
  film.save
end