json.extract! person, :id, :name, :birth_year, :eye_color, :gender, :hair_color, :height, :mass, :skin_color, :created_at, :updated_at
json.url person_url(person, format: :json)