class Recruitment < ActiveRecord::Base
  validates :title, :content, :concept, :deadline, presence: true
  belongs_to :user
  has_many :ansers, dependent: :destroy
end
