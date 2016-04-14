class Pet < ActiveRecord::Base
  belongs_to :user

  validates :pet_name, :owner, presence: true
end
