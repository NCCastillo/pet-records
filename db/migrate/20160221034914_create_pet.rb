class CreatePet < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :pet_name
    end
  end
end
