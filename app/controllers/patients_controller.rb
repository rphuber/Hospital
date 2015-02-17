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
    @medications = @patient.medications
    @doctor = Doctor.new
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

  def create_doctor
    @patient = Patient.find params[:id]
    @doctor = @patient.doctors.create doctor_params
    redirect_to patient_path(@patient)
  end

  def check_in
    set_patient
    @patient.check_in!
    redirect_to patients_path
  end

  def see_doctor
    set_patient
    @patient.see_doctor!
    redirect_to patients_path
  end

  def get_xray
    set_patient
    @patient.get_xray!
    redirect_to patients_path
  end

  def enter_surgery
    set_patient
    @patient.enter_surgery!
    redirect_to patients_path
  end

  def check_out
    set_patient
    @patient.check_out!
    redirect_to patients_path
  end

  def pay_bill
    set_patient
    @patient.pay!
    redirect_to patients_path
    
  end

  def set_patient
    @patient = Patient.find params[:id]
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

  def doctor_params
      params.require(:doctor).permit(
        :name
      )
  end

end
