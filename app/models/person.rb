class Person < ApplicationRecord
  has_and_belongs_to_many :films
  belongs_to :planet
  has_and_belongs_to_many :species
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
end
