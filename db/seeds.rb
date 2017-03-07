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


url = BASE_URL + 'starships/'
loop do
  response = RestClient.get url
  hash = JSON.parse response
  starships = hash['results']

  require 'set'
  names = Set.new
  starships.each do |item|
    names.add? item['starship_class'].split.map(&:capitalize).join(' ')
  end
  names.each do |name|
    StarshipClass.create(name: name)
  end

  starships.each do |item|
    starship = Starship.create(
       id: parse_url_and_get_id(item['url']),
       name: item['name'],
       model: item['model'],
       manufacturer: item['manufacturer'],
       cost_in_credits: item['cost_in_credits'],
       length: item['length'],
       crew: item['crew'],
       passengers: item['passengers'],
       max_atmosphering_speed: item['max_atmosphering_speed'],
       hyperdrive_rating: item['hyperdrive_rating'],
       MGLT: item['MGLT'],
       cargo_capacity: item['cargo_capacity'],
       consumables: item['consumables'],
    )
    StarshipClass.find_by_name(item['starship_class'].split.map(&:capitalize).join(' ')).starships << starship
    item['films'].each do |f|
      tmp_film = Film.find f.split('/').last
      tmp_film.starships << starship
    end
    item['pilots'].each do |p|
      person = Person.find p.split('/').last
      person.starships << starship
    end
  end

  url = hash['next']
  break if url.nil?
end


url = BASE_URL + 'vehicles/'
loop do
  response = RestClient.get url
  hash = JSON.parse response
  vehicles = hash['results']
  vehicles.each do |item|
    vehicle = Vehicle.create(
        id: parse_url_and_get_id(item['url']),
        vehicle_class: item['vehicle_class'],
        passengers: item['passengers'],
        name: item['name'],
        model: item['model'],
        max_atmosphering_speed: item['max_atmosphering_speed'],
        manufacturer: item['manufacturer'],
        length: item['length'],
        crew: item['crew'],
        cost_in_credits: item['cost_in_credits'],
        consumables: item['consumables'],
        cargo_capacity: item['cargo_capacity']
    )
    item['films'].each do |f|
      tmp_film = Film.find f.split('/').last
      tmp_film.vehicles << vehicle
    end
    item['pilots'].each do |p|
      person = Person.find p.split('/').last
      person.vehicles << vehicle
    end
  end

  url = hash['next']
  break if url.nil?
end


url = BASE_URL + 'species/'
loop do
  response = RestClient.get url
  hash = JSON.parse response
  species = hash['results']
  species.each do |item|
    home = item['homeworld']
    planet = home ? Planet.find(parse_url_and_get_id(home)) : nil
    the_species = Species.create(
        id: parse_url_and_get_id(item['url']),
        average_height: item['average_height'],
        average_lifespan: item['average_lifespan'],
        classification: item['classification'],
        designation: item['designation'],
        eye_colors: item['eye_colors'],
        hair_colors: item['hair_colors'],
        language: item['language'],
        name: item['name'],
        skin_colors: item['skin_colors'],
        planet_id: planet&.id
    )

    item['films'].each do |f|
      tmp_film = Film.find f.split('/').last
      tmp_film.species << the_species
    end
    item['people'].each do |p|
      person = Person.find p.split('/').last
      person.species << the_species
    end

    planet.species << the_species if planet
  end

  url = hash['next']
  break if url.nil?
end
