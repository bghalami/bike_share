class Station < ApplicationRecord

   has_many :trips, class_name: "Trip", foreign_key: 'start_station_id'
   has_many :trips, class_name: "Trip", foreign_key: 'end_station_id'

  validates_presence_of :name, :dock_count, :city, :installation_date

  before_save :generate_slug

  has_many :trips

  def generate_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end


end
