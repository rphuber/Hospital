class MedicationsController < ApplicationController

  def index
    @medications = Medication.all
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.create medication_params
    redirect_to medications_path
  end

  def edit
    @medication = Medication.find params[:id]
    @patients = Patient.all
  end

  def update
    @medication = Medication.find params[:id]
    @medication.update_attributes medication_params
    redirect_to medications_path
  end

  def destroy
    @medication = Medication.find params[:id]
    @medication.delete
    redirect_to medications_path
  end

  private
  
  def medication_params
    params.require(:medication).permit(
      :name,
      :dosage,
      :frequency,
      patient_ids: []
    )
  end

end
