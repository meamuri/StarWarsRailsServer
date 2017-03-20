class Film < ApplicationRecord
  include PgSearch
  default_scope {order(episode_id: :desc)}

  has_and_belongs_to_many :people
  has_and_belongs_to_many :planets
  has_and_belongs_to_many :species
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles

  has_attached_file :poster,
                    styles: {medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :poster, content_type: /\Aimage\/.*\z/

  attr_accessor :delete_poster
  before_validation { self.poster.clear if :delete_poster == "1" }
end
