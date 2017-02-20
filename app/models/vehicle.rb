class Vehicle < ApplicationRecord
  has_and_belongs_to_many :people
  has_and_belongs_to_many :films
end
