class Recruitment < ActiveRecord::Base
  validates :title, presence: true
end
