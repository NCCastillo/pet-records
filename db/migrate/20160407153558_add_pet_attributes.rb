class AddPetAttributes < ActiveRecord::Migration
  def change
    add_column :pets, :owner, :string
    add_column :pets, :breed, :string
    add_column :pets, :age, :integer
  end
end
