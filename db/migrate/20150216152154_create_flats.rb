class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.string :city
      t.integer :price
      t.references :user, index: true
      t.boolean :availability

      t.timestamps null: false
    end
    add_foreign_key :flats, :users
  end
end
