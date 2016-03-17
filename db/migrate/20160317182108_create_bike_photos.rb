class CreateBikePhotos < ActiveRecord::Migration
  def change
    create_table :bike_photos do |t|
      t.integer :bike_id
      t.integer :user_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
