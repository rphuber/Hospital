class FacilitiesController < ApplicationController

  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @facilities = Facility.all
  end
  
  # GET /restaurants/new
  def new
    @facility = Facility.new
    @patients = Patient.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @patients = @facility.patients
    @doctor = Doctor.new
  end

  def create_doctor
    @facility = Facility.find params[:id]
    @doctor = @facility.doctors.create doctor_params
    redirect_to facility_path(@facility)
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @facility = Facility.new(facility_params)
    @patients = Patient.all
    # flash
    if @facility.save
      flash[:notice] = 'Facility was successfully created.'
      redirect_to facilities_path
    else
      flash[:error] = "Facility was NOT saved."
      render :new
    end
  end

  def edit
    @facility = Facility.find params[:id]
    @patients = Patient.all
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    @patients = Patient.all
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to facilities_path, notice: 'Facility was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end
  
  def facility_params
    params.require(:facility).permit(
      :name, 
      patient_ids:[]
    )
  end

  def doctor_params
      params.require(:doctor).permit(
        :name
      )
    end

end
