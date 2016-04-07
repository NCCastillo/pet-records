class Pet < ActiveRecord::Base
  validates :pet_name, :owner, presence: true
end
