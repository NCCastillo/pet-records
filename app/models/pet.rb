class Pet < ActiveRecord::Base
  validates :pet_name, presence: true
end
