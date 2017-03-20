class Planet < ApplicationRecord
  multisearchable :against => [:name, :terrain, :climante]

  include PgSearch
  default_scope {order(id: :desc)}

  has_many :people
  has_and_belongs_to_many :films
  has_many :species
end
