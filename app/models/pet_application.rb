class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  validates_presence_of :pet_id, :application_id

  def self.application_pending(pet_id, app_id)
    where('pet_id = ? AND application_id = ?', pet_id, app_id).first.application_status == 'Pending'
  end

  def self.application_approved(pet_id, app_id)
    where('pet_id = ? AND application_id = ?', pet_id, app_id).first.application_status == 'Approved'
  end

  def self.application_rejected(pet_id, app_id)
    where('pet_id = ? AND application_id = ?', pet_id, app_id).first.application_status == 'Rejected'
  end
end
