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
    @patient.in!
    redirect_to patients_path
  end

  def see_doctor
    @patient.doctor!
    redirect_to patients_path
  end

  def get_xray
    @patient.xray!
    redirect_to patients_path
  end

  def enter_surgery
    @patient.surgery!
    redirect_to patients_path
  end

  def check_out
    @patient.out!
    redirect_to patients_path
  end

  def pay_bill
    @patient.paid!
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

  def doctor_params
      params.require(:doctor).permit(
        :name
      )
  end

end
