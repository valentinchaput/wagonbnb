class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :checkin
      t.date :checkout
      t.references :user, index: true
      t.references :flat, index: true

      t.timestamps null: false
    end
    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :flats
  end
end
