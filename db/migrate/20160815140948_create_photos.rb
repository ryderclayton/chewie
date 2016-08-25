class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos, force: true do |t|
      t.text :caption
      t.integer :place_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :picture
      t.timestamps
    end
  end
end
