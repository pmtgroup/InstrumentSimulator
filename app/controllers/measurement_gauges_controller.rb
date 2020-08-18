class MeasurementGaugesController < ApplicationController
  before_action :set_measurement_gauge, only: [:show, :edit, :update, :destroy]

  # GET /measurement_gauges
  # GET /measurement_gauges.json
  def index
    @measurement_gauges = MeasurementGauge.all
  end

  # GET /measurement_gauges/1
  # GET /measurement_gauges/1.json
  def show
  end

  # GET /measurement_gauges/new
  def new
    @measurement_gauge = MeasurementGauge.new
  end

  # GET /measurement_gauges/1/edit
  def edit
  end

  # POST /measurement_gauges
  # POST /measurement_gauges.json
  def create
    @measurement_gauge = MeasurementGauge.new(measurement_gauge_params)

    respond_to do |format|
      if @measurement_gauge.save
        format.html { redirect_to @measurement_gauge, notice: 'Данные сохранены' }
        format.json { render :show, status: :created, location: @measurement_gauge }
      else
        format.html { render :new }
        format.json { render json: @measurement_gauge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurement_gauges/1
  # PATCH/PUT /measurement_gauges/1.json
  def update
    respond_to do |format|
      if @measurement_gauge.update(measurement_gauge_params)
        format.html { redirect_to @measurement_gauge, notice: 'Данные сохранены' }
        format.json { render :show, status: :ok, location: @measurement_gauge }
      else
        format.html { render :edit }
        format.json { render json: @measurement_gauge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurement_gauges/1
  # DELETE /measurement_gauges/1.json
  def destroy
    @measurement_gauge.destroy
    respond_to do |format|
      format.html { redirect_to measurement_gauges_url, notice: 'Measurement gauge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement_gauge
      @measurement_gauge = MeasurementGauge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_gauge_params
      params.require(:measurement_gauge).permit(:number_guage, :control_tool_id, :number_vibration_sensor, :number_local_vibration_sensor1, :number_local_vibration_sensor2, :number_noise_sensor, :number_infrasound_sensor)
    end
end
