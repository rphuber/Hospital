class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @facility = Facility.find params[:facility_id]
    @patient = @facility.patients.new  
  end

  def show
    @patient = Patient.find params[:id]
    @facility = Facility.find @patient.facility_id
    @medications = @patient.medications
  end

  def create
    @facility = Facility.find params[:facility_id]
    @patient = @facility.patients.create patient_params
    redirect_to facility_path(@facility)
  end

  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    @facility = Facility.find @patient.facility_id
    @patient.update_attributes patient_params
    redirect_to facility_path(@facility)
  end

  def destroy
    @patient = Patient.find params[:id]
    @facility = Facility.find @patient.facility_id
    @patient.delete
    redirect_to facility_path(@facility)
  end

  private
  
  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dob,
      :symptoms,
      :gender,
      :blood_type
    )
  end

end
