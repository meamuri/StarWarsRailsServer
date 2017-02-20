class Planet < ApplicationRecord
  has_many :people
  has_and_belongs_to_many :films
  has_many :films
end
