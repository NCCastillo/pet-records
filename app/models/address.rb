class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :address_1, :city, :state, :zip_code, presence: true
end
