class Veterinarian < ActiveRecord::Base
  has_one :address, as: :addressable
end
