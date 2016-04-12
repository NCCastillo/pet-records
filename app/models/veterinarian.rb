class Veterinarian < ActiveRecord::Base
  has_one :address, as: :addressable

  validates :organization_name, presence: true
end
