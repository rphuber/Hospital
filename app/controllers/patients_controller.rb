class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def new
    @patient = Patient.new  
  end

  def show
    
  end

  def create
    @patient = Patient.new(patient_params)
    # flash
    if @patient.save
      flash[:notice] = 'Restaurant was successfully created.'
      redirect_to root_path
    else
      flash[:error] = "Restaurant was NOT saved."
      render :new
    end
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient records were successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end
  
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
