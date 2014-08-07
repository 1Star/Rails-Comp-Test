class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.date :tour_date
      t.string :amenity
      t.string :note
      t.integer :user_id

      t.timestamps
    end
  end
end
