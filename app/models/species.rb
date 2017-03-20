class Species < ApplicationRecord
  include PgSearch
  multisearchable :against => [:name, :language]

  belongs_to :planet, optional: true
  has_and_belongs_to_many :people
  has_and_belongs_to_many :films
end
