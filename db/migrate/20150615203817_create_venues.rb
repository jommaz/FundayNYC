class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.references :segment, index: true, foreign_key: true
      t.string :name
      t.string :desc
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps null: false
    end
  end
end
