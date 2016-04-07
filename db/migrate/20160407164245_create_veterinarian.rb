class CreateVeterinarian < ActiveRecord::Migration
  def change
    create_table :veterinarians do |t|
      t.string :organization_name
      t.string :vet_name

      t.timestamps
    end
  end
end
