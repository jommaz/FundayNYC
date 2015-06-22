class AddLatitudeAndLongitudeToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :lat, :float
    add_column :segments, :lng, :float
  end
end
