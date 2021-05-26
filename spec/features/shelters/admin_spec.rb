require 'rails_helper'

RSpec.describe 'Shelter Admin Page' do
  before :each do
    @shelter_1 = Shelter.create!(foster_program: true, name: 'Pet-a-saurus', city: 'Arvada', rank: 17)
    @shelter_2 = Shelter.create!(foster_program: false, name: 'Petguins', city: 'Denver', rank: 12)
    @shelter_3 = Shelter.create!(foster_program: false, name: 'Pets', city: 'Denver', rank: 12)
    @shelter_4 = Shelter.create!(foster_program: false, name: 'Pet-tacular', city: 'Denver', rank: 12)
    @shelter_5 = Shelter.create!(foster_program: false, name: 'Petins', city: 'Denver', rank: 12)
    @shelter_6 = Shelter.create!(foster_program: false, name: 'Another Pet Store', city: 'Denver', rank: 12)

    @pet_1 = @shelter_1.pets.create!(adoptable: true, age: 3, breed: 'Newfoundland', name: 'Huey')
    @pet_2 = @shelter_1.pets.create!(adoptable: false, age: 7, breed: 'Bernese Mountain Dog', name: 'Watermelon')
    @pet_3 = @shelter_2.pets.create!(adoptable: true, age: 1, breed: 'Golden Retriever', name: 'Sir William Wallace')
    @pet_4 = @shelter_3.pets.create!(adoptable: true, age: 5, breed: 'Border Collie', name: 'Bobby Mounahan')
    @pet_5 = @shelter_4.pets.create!(adoptable: true, age: 1, breed: 'Goldent Retriever', name: 'Huey')
    @pet_6 = @shelter_5.pets.create!(adoptable: true, age: 3, breed: 'Goldent Retriever', name: 'Huey')
    @pet_7 = @shelter_2.pets.create!(adoptable: true, age: 7, breed: 'Border Collie', name: 'Huey')

    @application_1 = Application.create!(name: 'Roald Marshallsen', state: 'Colorado', city: 'Arvada', address: '1744 N. Pole Ln.', zip_code: 80004, status: 'In Progress')
    @application_2 = Application.create!(name: 'Matt Smith', state: 'Colorado', city: 'Westminster', address: '2314 Gamble Oak St.', zip_code: 80003, status: 'In Progress')
    @application_3 = Application.create!(name: 'Larry', state: 'Colorado', city: 'Brighton', address: '1623 Gamble Oak St.', zip_code: 80233, description: 'I love animals', status: 'In Progress')
    @application_4 = Application.create!(name: 'Phil', state: 'Colorado', city: 'Nederland', address: '3121 Gamble Oak St.', zip_code: 80233, description: 'I love animals', status: 'Pending')
    @application_5 = Application.create!(name: 'Marshall', state: 'Colorado', city: 'Boulder', address: '4323 Gamble Oak St.', zip_code: 80233, description: 'I love animals', status: 'Pending')
    @application_6 = Application.create!(name: 'Sam', state: 'Colorado', city: 'Aurora', address: '6543 Gamble Oak St.', zip_code: 80233, description: 'I love animals', status: 'Pending')

    @pet_app_1 = PetApplication.create!(pet_id: @pet_1.id, application_id: @application_1.id)
    @pet_app_2 = PetApplication.create!(pet_id: @pet_2.id, application_id: @application_1.id)
    @pet_app_3 = PetApplication.create!(pet_id: @pet_3.id, application_id: @application_1.id)
    @pet_app_4 = PetApplication.create!(pet_id: @pet_1.id, application_id: @application_2.id)
    @pet_app_5 = PetApplication.create!(pet_id: @pet_4.id, application_id: @application_2.id)
    @pet_app_6 = PetApplication.create!(pet_id: @pet_5.id, application_id: @application_3.id)
    @pet_app_7 = PetApplication.create!(pet_id: @pet_6.id, application_id: @application_4.id)
    @pet_app_8 = PetApplication.create!(pet_id: @pet_7.id, application_id: @application_5.id)
    @pet_app_9 = PetApplication.create!(pet_id: @pet_2.id, application_id: @application_6.id)

    visit '/admin/shelters'
  end

  it 'displays all shelters in reverse aplhabetical order by name' do
    expect(@shelter_3.name).to appear_before(@shelter_6.name)
  end

  it 'shows all shelters with pending applications' do
    expect(page).to have_content('Shelters With Pending Applications')
  end
end
