class ServiceUnitsController < ApplicationController
  before_action :set_service_unit, only: %i[ show edit update destroy ]
  before_action :set_service_category, only: %i[ new create]

  # GET /service_units or /service_units.json
  def index
    @service_units = ServiceUnit.all
  end

  # GET /service_units/1 or /service_units/1.json
  def show
  end

  # GET /service_units/new
  def new
    @service_unit = ServiceUnit.new
  end

  # GET /service_units/1/edit
  def edit
  end

  # POST /service_units or /service_units.json
  def create
    @service_unit = @service_category.service_units.new(service_unit_params)

    respond_to do |format|
      if @service_unit.save
        format.html { redirect_to service_category_url(@service_category), notice: "Service unit was successfully created." }
        format.json { render :show, status: :created, location: @service_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_units/1 or /service_units/1.json
  def update
    respond_to do |format|
      if @service_unit.update(service_unit_params)
        format.html { redirect_to service_category_url(@service_unit.service_category), notice: "Service unit was successfully updated." }
        format.json { render :show, status: :ok, location: @service_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_units/1 or /service_units/1.json
  def destroy
    @service_unit.destroy

    respond_to do |format|
      format.html { redirect_to service_category_url(@service_unit.service_category), notice: "Service unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_unit
      @service_unit = ServiceUnit.find(params[:id])
    end

    def set_service_category
      @service_category = ServiceCategory.find(params[:service_category_id])
    end

    # Only allow a list of trusted parameters through.
    def service_unit_params
      params.require(:service_unit).permit(:name)
    end
end
