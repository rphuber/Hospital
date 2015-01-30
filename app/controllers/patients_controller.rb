class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
    @facilities = Facility.all
  end

  def create
    @patient = Patient.create patient_params
    redirect_to facility_path(@facility)
  end

  def edit
    @patient = Patient.find params[:id]
    @facilities = Facility.all
  end

  def update
    @patient = Patient.find params[:id]
    @patient.update_attributes patient_params
    redirect_to patients_path
  end

  def destroy
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to patients_path
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
