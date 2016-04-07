class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, index: true
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :zip_code

      t.timestamps
    end
  end
end
