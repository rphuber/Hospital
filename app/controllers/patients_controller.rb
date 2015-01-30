class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
    @facilities = Facility.all
    @medications = Medication.all
  end

  def create
    @patient = Patient.create patient_params
    redirect_to patients_path
  end

  def show
    @patient = Patient.find params[:id]
    @medications = Medication.all
  end

  def edit
    @patient = Patient.find params[:id]
    @facilities = Facility.all
    @medications = Medication.all
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
      :blood_type, 
      facility_ids: [],
      medication_ids: []
    )
  end

end
