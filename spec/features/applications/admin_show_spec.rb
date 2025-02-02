require 'rails_helper'

RSpec.describe 'Admin Application Show Page' do
  before :each do
    @shelter_1 = Shelter.create!(foster_program: true, name: 'Pet-a-saurus', city: 'Arvada', rank: 17)
    @shelter_2 = Shelter.create!(foster_program: false, name: 'Petguins', city: 'Denver', rank: 12)

    @pet_1 = @shelter_1.pets.create!(adoptable: true, age: 3, breed: 'Newfoundland', name: 'Huey')
    @pet_2 = @shelter_1.pets.create!(adoptable: false, age: 7, breed: 'Bernese Mountain Dog', name: 'Watermelon')
    @pet_3 = @shelter_2.pets.create!(adoptable: true, age: 1, breed: 'Golden Retriever', name: 'Sir William Wallace')
    @pet_4 = @shelter_2.pets.create!(adoptable: true, age: 5, breed: 'Border Collie', name: 'Bobby Mounahan')
    @pet_5 = @shelter_2.pets.create!(adoptable: true, age: 1, breed: 'Goldent Retriever', name: 'Huey')
    @pet_6 = @shelter_2.pets.create!(adoptable: true, age: 3, breed: 'Goldent Retriever', name: 'Huey')
    @pet_7 = @shelter_2.pets.create!(adoptable: true, age: 7, breed: 'Border Collie', name: 'Huey')

    @application_1 = Application.create!(name: 'Roald Marshallsen', state: 'Colorado', city: 'Arvada', address: '1744 N. Pole Ln.', zip_code: 80004, status: 'In Progress')
    @application_2 = Application.create!(name: 'Matt Smith', state: 'Colorado', city: 'Westminster', address: '2314 Gamble Oak St.', zip_code: 80003, status: 'In Progress')
    @application_3 = Application.create!(name: 'Larry', state: 'Colorado', city: 'Westminster', address: '1623 Gamble Oak St.', zip_code: 80233, description: 'I love animals', status: 'In Progress')

    @pet_app_1 = PetApplication.create!(pet_id: @pet_1.id, application_id: @application_1.id)
    @pet_app_2 = PetApplication.create!(pet_id: @pet_2.id, application_id: @application_1.id)
    @pet_app_3 = PetApplication.create!(pet_id: @pet_3.id, application_id: @application_1.id)
    @pet_app_4 = PetApplication.create!(pet_id: @pet_1.id, application_id: @application_2.id)
    @pet_app_5 = PetApplication.create!(pet_id: @pet_4.id, application_id: @application_2.id)
  end

  it 'shows all pets associated with application' do
    visit "/admin/applications/#{@application_1.id}"

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_3.name)
    expect(page).to_not have_content(@pet_4.name)
  end

  it 'Shows a button to approve a pet' do
    visit "/admin/applications/#{@application_1.id}"

    expect(page).to have_button('Approve Huey')
  end

  it 'Shows a button to reject pet' do
    visit "/admin/applications/#{@application_1.id}"

    expect(page).to have_button('Reject Huey')
  end

  it 'changes pet application status to approved when approving application' do
    visit "/admin/applications/#{@application_1.id}"

    click_on 'Approve Huey'

    expect(current_path).to eq("/admin/applications/#{@application_1.id}")
    expect(page).to have_content('Huey Approved')
  end

  it 'changes pet application status to rejected when rejecting application' do
    visit "/admin/applications/#{@application_1.id}"

    click_on 'Reject Huey'

    expect(current_path).to eq("/admin/applications/#{@application_1.id}")
    expect(page).to have_content('Huey Rejected')
  end

  it 'doesnt affect the same pet on another application' do
    visit "/admin/applications/#{@application_1.id}"

    click_on 'Reject Huey'

    expect(page).to have_content('Huey Rejected')

    visit "/admin/applications/#{@application_2.id}"

    click_on 'Approve Huey'

    expect(page).to have_content('Huey Approved')
  end
end
