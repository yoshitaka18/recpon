class AddColumnToAnsers < ActiveRecord::Migration
  def change
    add_column :ansers, :adopt, :boolean, default: false, null: false
  end
end
