class CreateAnsers < ActiveRecord::Migration
  def change
    create_table :ansers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :recruitment, index: true, foreign_key: true
      t.text :anser
      t.text :comment

      t.timestamps null: false
    end
  end
end
