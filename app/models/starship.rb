class Starship < ApplicationRecord
  has_and_belongs_to_many :people
  has_and_belongs_to_many :films

  belongs_to :starship_class
end
