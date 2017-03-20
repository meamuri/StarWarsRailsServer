class Vehicle < ApplicationRecord
  include PgSearch
  multisearchable :against => [:name, :model, :manufacturer]

  has_and_belongs_to_many :people
  has_and_belongs_to_many :films
end
