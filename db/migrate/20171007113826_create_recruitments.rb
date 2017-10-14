class CreateRecruitments < ActiveRecord::Migration
  def change
    create_table :recruitments do |t|
      t.string   "title"
      t.text     "content"
      t.text     "concept"
      t.datetime "deadline"
      t.string   "image_url"
      t.text     "map_url"

      t.timestamps null: false
    end
  end
end
