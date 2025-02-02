Application.destroy_all
PetApplication.destroy_all
Pet.destroy_all
Shelter.destroy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all

@shelter_1 = Shelter.create!(foster_program: true, name: 'Pet-a-saurus', city: 'Arvada', rank: 17)
@shelter_2 = Shelter.create!(foster_program: false, name: 'Petguins', city: 'Denver', rank: 12)

@pet_1 = @shelter_1.pets.create!(adoptable: true, age: 3, breed: 'Newfoundland', name: 'Huey')
@pet_2 = @shelter_1.pets.create!(adoptable: false, age: 7, breed: 'Bernese Mountain Dog', name: 'Watermelon')
@pet_3 = @shelter_2.pets.create!(adoptable: true, age: 1, breed: 'Golden Retriever', name: 'Sir William Wallace')
@pet_4 = @shelter_2.pets.create!(adoptable: true, age: 5, breed: 'Border Collie', name: 'Bobby Mounahan')
@pet_5 = @shelter_2.pets.create!(adoptable: true, age: 4, breed: 'Border Collie', name: 'Larry')
@pet_6 = @shelter_2.pets.create!(adoptable: true, age: 7, breed: 'Border Collie', name: 'Cucumber')
@pet_7 = @shelter_2.pets.create!(adoptable: true, age: 8, breed: 'Border Collie', name: 'Milkshake')
@pet_8 = @shelter_2.pets.create!(adoptable: true, age: 1, breed: 'Border Collie', name: 'Rory')
@pet_9 = @shelter_2.pets.create!(adoptable: true, age: 3, breed: 'Border Collie', name: 'Dr. Who')
@pet_10 = @shelter_2.pets.create!(adoptable: true, age: 2, breed: 'Border Collie', name: 'Swan')

@vet_office_1 = VeterinaryOffice.create!(boarding_services: true, max_patient_capacity: 15, name: 'On The Mend')
@vet_office_2 = VeterinaryOffice.create!(boarding_services: false, max_patient_capacity: 10, name: 'Petsopital')

@veterinarian_1 = @vet_office_1.veterinarians.create!(on_call: true, review_rating: 3, name: 'Jimmy ShakyHands')
@veterinarian_2 = @vet_office_1.veterinarians.create!(on_call: true, review_rating: 1, name: 'Randolph McDonalds')
@veterinarian_3 = @vet_office_2.veterinarians.create!(on_call: false, review_rating: 4, name: 'Stephanie Lastname')
@veterinarian_4 = @vet_office_2.veterinarians.create!(on_call: true, review_rating: 5, name: 'Roald Penguin')

@app_1 = Application.create!(name: 'Roald Roaldersun', state: 'Colorado', city: 'Arvada', zip_code: 80004, address: '1121 Allison St.', description: 'hey', status: 'Pending')
@app_2 = Application.create!(name: 'Robert Bobert', state: 'Colorado', city: 'Brighton', zip_code: 80601, address: '4133 Cherry St.')
@app_3 = Application.create!(name: 'Miles Warner', state: 'Colorado', city: 'Westminster', zip_code: 80233, address: '7175 Gamble Oak St.')
@app_4 = Application.create!(name: 'Ray Maestas', state: 'Colorado', city: 'Lakewood', zip_code: 80003, address: '2121 Garrison St.')
@app_5 = Application.create!(name: 'Larry', state: 'Colorado', city: 'Rifle', zip_code: 80002, address: '1324 Garrison St.')
@app_6 = Application.create!(name: 'Hawky McHawkerton', state: 'Colorado', city: 'Black Hawk', zip_code: 80233, address: '8473 Garrison St.')
@app_7 = Application.create!(name: 'Big Rick', state: 'Colorado', city: 'Aurora', zip_code: 18232, address: '2039 Garrison St.')
@app_8 = Application.create!(name: 'Lando', state: 'Colorado', city: 'Commerce City', zip_code: 12433, address: '9033 Garrison St.', description: 'hey', status: 'Pending')
@app_9 = Application.create!(name: 'Luke', state: 'Colorado', city: 'Lakewood', zip_code: 99948, address: '8293 Garrison St.', description: 'hello', status: 'Pending')

@pet_app_1 = PetApplication.create!(pet_id: @pet_1.id, application_id: @app_1.id)
@pet_app_2 = PetApplication.create!(pet_id: @pet_2.id, application_id: @app_1.id)
@pet_app_3 = PetApplication.create!(pet_id: @pet_3.id, application_id: @app_1.id)
@pet_app_4 = PetApplication.create!(pet_id: @pet_1.id, application_id: @app_2.id)
@pet_app_5 = PetApplication.create!(pet_id: @pet_4.id, application_id: @app_8.id)
@pet_app_6 = PetApplication.create!(pet_id: @pet_8.id, application_id: @app_9.id)
@pet_app_7 = PetApplication.create!(pet_id: @pet_9.id, application_id: @app_8.id)
@pet_app_8 = PetApplication.create!(pet_id: @pet_10.id, application_id: @app_9.id)
@pet_app_9 = PetApplication.create!(pet_id: @pet_5.id, application_id: @app_8.id)
