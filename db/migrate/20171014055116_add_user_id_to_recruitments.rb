class AddUserIdToRecruitments < ActiveRecord::Migration
  def change
    add_column :recruitments, :user_id, :integer
  end
end
