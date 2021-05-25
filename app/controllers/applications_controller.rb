class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @desired_pets = PetApplication.where('application_id = ?', @application.id)
    @pet_apps = @desired_pets.map do |pet_application|
      Pet.find(pet_application.pet_id)
    end.uniq

    if params[:name] != nil
      @pets = Pet.where('name = ?', params[:name]).all
    end
  end

  def new_pet
    PetApplication.create(pet_id: params[:new_pet_id], application_id: params[:id])
    redirect_to "/applications/#{params[:id]}"
  end

  def submit_app
    application = Application.find(params[:id])
    application.update(description: params[:description], status: 'Pending')
    redirect_to "/applications/#{application.id}"
  end

  def new
  end

  def create
    @application = Application.new(application_params)

    if @application.save
      redirect_to "/applications/#{@application.id}"
    else
      flash[:alert] = @application.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def application_params
    params.permit(:id, :name, :state, :city, :zip_code, :address)
  end
end
