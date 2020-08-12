class NoiseIndicatorsController < ApplicationController
  before_action :set_noise_indicator, only: [:show, :edit, :update, :destroy]

  # GET /noise_indicators
  # GET /noise_indicators.json
  def index
    @noise_indicators = NoiseIndicator.all
  end

  # GET /noise_indicators/1
  # GET /noise_indicators/1.json
  def show
  end

  # GET /noise_indicators/new
  def new
    @noise_indicator = NoiseIndicator.new
  end

  # GET /noise_indicators/1/edit
  def edit
  end

  # POST /noise_indicators
  # POST /noise_indicators.json
  def create
    @noise_indicator = NoiseIndicator.new(noise_indicator_params)

    respond_to do |format|
      if @noise_indicator.save
        format.html { redirect_to StaffWorker.find(@noise_indicator.staff_worker_id), notice: 'Noise indicator was successfully created.' }
        format.json { render :show, status: :created, location: @noise_indicator }
      else
        format.html { render :new }
        format.json { render json: @noise_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noise_indicators/1
  # PATCH/PUT /noise_indicators/1.json
  def update
    respond_to do |format|
      if @noise_indicator.update(noise_indicator_params)
        format.html { redirect_to @noise_indicator, notice: 'Noise indicator was successfully updated.' }
        format.json { render :show, status: :ok, location: @noise_indicator }
      else
        format.html { render :edit }
        format.json { render json: @noise_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noise_indicators/1
  # DELETE /noise_indicators/1.json
  def destroy
    @noise_indicator.destroy
    respond_to do |format|
      format.html { redirect_to noise_indicators_url, notice: 'Noise indicator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noise_indicator
      @noise_indicator = NoiseIndicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noise_indicator_params
      params.require(:noise_indicator).permit(:terms,
                                      :frequency_31,
                                      :frequency_63,
                                      :frequency_125,
                                      :frequency_250,
                                      :frequency_500,
                                      :frequency_1000,
                                      :frequency_2000,
                                      :frequency_4000,
                                      :frequency_8000,
                                      :min_lvl,
                                      :max_lvl,
                                      :pulse_noise,
                                      :peak_lvl,
                                      :equivalent_lvl,
                                      :character_noise,
                                      :staff_worker_id
                                      )
    end
end
