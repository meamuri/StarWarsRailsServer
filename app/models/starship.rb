class Starship < ApplicationRecord
  include PgSearch
  has_and_belongs_to_many :people
  has_and_belongs_to_many :films

  belongs_to :starship_class

  def sclass
    read_attribute('starship_class')
  end
end
