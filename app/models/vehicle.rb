class Vehicle < ApplicationRecord
  include PgSearch
  has_and_belongs_to_many :people
  has_and_belongs_to_many :films
end
