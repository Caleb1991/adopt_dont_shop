require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  before :each do
    @shelter_1 = Shelter.create!(foster_program: true, name: 'Petasaurus', city: 'Arvada', rank: 4)
    @pet_1 = Pet.create!(adoptable: true, age: 3, breed: 'Bernese Mountain Dog', name: 'Watermelon', shelter_id: @shelter_1.id)
    @application_1 = Application.create!(name: 'Roald', state: 'Colorado', city: 'Arvada', zip_code: 80004, address: '6406 Gamble St.', description: 'I love animals', status: 'Pending')
    @application_2 = Application.create!(name: 'Marshall', state: 'Colorado', city: 'Westminster', zip_code: 80003, address: '4426 Gamble St.', description: 'I love animals', status: 'Pending')
    @application_3 = Application.create!(name: 'Deku', state: 'Colorado', city: 'Lakewood', zip_code: 80002, address: '1242 Gamble St.', description: 'I love animals', status: 'Pending')
    @pet_app_1 = PetApplication.create!(pet_id: @pet_1.id, application_id: @application_1.id, application_status: 'Pending')
    @pet_app_2 = PetApplication.create!(pet_id: @pet_1.id, application_id: @application_2.id, application_status: 'Approved')
    @pet_app_3 = PetApplication.create!(pet_id: @pet_1.id, application_id: @application_3.id, application_status: 'Rejected')
  end

  describe 'relationships' do
    it {should belong_to(:pet)}
    it {should belong_to(:application)}
  end

  describe 'validations' do
    it {should validate_presence_of(:pet_id)}
    it {should validate_presence_of(:application_id)}
  end

  describe 'class methods' do
    describe '#application_pending' do
      it 'returns true if pet application status is pending' do

        expect(PetApplication.application_pending(@pet_1.id, @application_1.id)).to eq(true)
        expect(PetApplication.application_pending(@pet_1.id, @application_2.id)).to eq(false)
      end
    end

    describe '#application_approved' do
      it 'returns true if pet application status is approved' do

        expect(PetApplication.application_approved(@pet_1.id, @application_2.id)).to eq(true)
        expect(PetApplication.application_approved(@pet_1.id, @application_1.id)).to eq(false)
      end
    end

    describe '#application_rejected' do
      it 'returns true if pet application status is rejected' do

        expect(PetApplication.application_rejected(@pet_1.id, @application_3.id)).to eq(true)
        expect(PetApplication.application_rejected(@pet_1.id, @application_2.id)).to eq(false)
      end
    end
  end
end
