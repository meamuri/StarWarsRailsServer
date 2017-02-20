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
  film.id = f['url'].split('/').last
  film.director = f['director']
  film.episode_id = f['episode_id']
  film.opening_crawl = f['opening_crawl']
  film.producer = f['producer']
  film.release_date = f['release_date']
  film.title = f['title']
  film.save
end


json = RestClient.get BASE_URL + 'planets/'
planets = JSON.parse json
planets['results'].each do |p|
  planet = Planet.new
  planet.id = p['url'].split('/').last
  planet.name = p['name']
  planet.diameter = p['diameter']
  planet.rotation_period = p['rotation_period']
  planet.orbital_period = p['rotation_period']
  planet.gravity = p['gravity']
  planet.population = p['population']
  planet.climate = p['climate']
  planet.terrain = p['terrain']
  planet.surface_water = p['surface_water']
  planet.save
  p['films'].each do |f|
    tmp_film = Film.find f.split('/').last
    tmp_film.planets << planet
  end
end


json = RestClient.get BASE_URL + 'people/'
people = JSON.parse json
people['results'].each do |p|
  person = Person.new
  person.name=p['name']
  person.birth_year=p['birth_year']
  person.eye_color=p['eye_color']
  person.gender=p['gender']
  person.hair_color=p['hair_color']
  person.height=p['height']
  person.mass = p['mass']
  person.skin_color=p['skin_color']
  person.id = p['url'].split('/').last
  # puts p['films']
  # person.save
  # p['films'].each do |f|
  #   tmp_film = Film.find f.split('/').last
  #   tmp_film.people << person
  # end
end