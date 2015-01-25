class FacilitiesController < ApplicationController

  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
  end

  def show
    @patients = @facility.patients
    
  end

  def create
    @facility = Facility.new(facility_params)
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
    
  end

  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Facility was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end
  
  def facility_params
    params.require(:facility).permit(
      :name
    )
  end

end
