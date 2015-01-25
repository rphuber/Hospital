class MedicationsController < ApplicationController

  def index
    @patient = Patient.find params[:patient_id]
    @medications = @patient.medications
  end

  def show
    @patient = Patient.find params[:patient_id]
    @medications = @patient.medications
  
  end

  def new
    @patient = Patient.find params[:patient_id]
    @medication = @patient.medications.new  
  end

  def create
    @patient = Patient.find params[:patient_id]
    @medication = @patient.medications.create medication_params
    redirect_to patient_path(@patient)
  end

  def edit
    @medication = Medication.find params[:id]
  end

  def update
    @medication = Medication.find params[:id]
    @patient = Patient.find @medication.patient_id
    @medication.update_attributes medication_params
    redirect_to patient_medications_path(@patient)
  end

  def destroy
    @medication = Medication.find params[:id]
    @patient = Patient.find @medication.patient_id
    @medication.delete
    redirect_to patient_medications_path(@patient)
  end

  private
  
  def medication_params
    params.require(:medication).permit(
      :name,
      :dosage,
      :frequency
    )
  end

end
