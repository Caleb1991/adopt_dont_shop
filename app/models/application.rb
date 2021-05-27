class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications
  has_many :shelters, through: :pets

  validates_presence_of :name, :state, :city, :zip_code, :address, :description, :status
end
