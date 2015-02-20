class AddCoordinatesToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :latitude, :float
    add_column :flats, :longitude, :float
  end
end
