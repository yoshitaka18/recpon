class Recruitment < ActiveRecord::Base
  validates :title, :content, :concept, :deadline, presence: true
  belongs_to :user
  has_many :ansers, dependent: :destroy
  before_save :geocode_full_address

  def geocode_full_address
    coords = Geocoder.coordinates(
      self.map_url # 住所
    )
    self.latitude = coords[0]
    self.longitude = coords[1]
  end

end
