def parse_url_and_get_id(url_string)
  url_string.split('/').last
end

require 'rest-client'
require 'json'
BASE_URL = 'http://swapi.co/api/'


url = BASE_URL + 'films/'
loop do
  response = RestClient.get url
  hash = JSON.parse response
  films = hash['results']
  films.each do |f|
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
  url = hash['next']
  break if url.nil?
end

url = BASE_URL + 'planets/'
loop do
  responce = RestClient.get url
  hash = JSON.parse responce
  planets = hash['results']
  planets.each do |p|
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

  url = hash['next']
  break if url.nil?
end

url = BASE_URL + 'people/'
loop do
  response = RestClient.get url
  hash = JSON.parse response
  people = hash['results']
  people.each do |p|
    planet = Planet.find p['homeworld'].split('/').last

    person = Person.create(id: parse_url_and_get_id(p['url']),
                           birth_year: p['birth_year'],
                           eye_color: p['eye_color'],
                           gender: p['gender'],
                           hair_color: p['hair_color'],
                           height: p['height'],
                           mass: p['mass'],
                           name: p['name'],
                           skin_color: p['skin_color'],
                           planet_id: planet.id)

    p['films'].each do |f|
      tmp_film = Film.find f.split('/').last
      tmp_film.people << person
    end
    planet.people << person
  end

  url = hash['next']
  break if url.nil?
end
