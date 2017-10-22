class AddColumnsToRecruitments < ActiveRecord::Migration
  def change
    add_column :recruitments, :latitude, :float
    add_column :recruitments, :longitude, :float
  end
end
