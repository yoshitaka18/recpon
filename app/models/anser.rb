class Anser < ActiveRecord::Base
  belongs_to :user
  belongs_to :recruitment

  def self.anser_current_user(user_id, recruitment_id)
    Anser.where(["user_id = ? and recruitment_id = ?", user_id, recruitment_id])
  end
end
