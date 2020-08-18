class BoostVibroIndicatorsController < ApplicationController
  before_action :set_boost_vibro_indicator, only: [:show, :edit, :update, :destroy]

  # GET /boost_vibro_indicators
  # GET /boost_vibro_indicators.json
  def index
    @boost_vibro_indicators = BoostVibroIndicator.all
  end

  # GET /boost_vibro_indicators/1
  # GET /boost_vibro_indicators/1.json
  def show
  end

  # GET /boost_vibro_indicators/new
  def new
    @boost_vibro_indicator = BoostVibroIndicator.new
  end

  # GET /boost_vibro_indicators/1/edit
  def edit
  end

  # POST /boost_vibro_indicators
  # POST /boost_vibro_indicators.json
  def create
    @boost_vibro_indicator = BoostVibroIndicator.new(boost_vibro_indicator_params)

    respond_to do |format|
      if @boost_vibro_indicator.save
        format.html { redirect_to @boost_vibro_indicator, notice: 'Boost vibro indicator was successfully created.' }
        format.json { render :show, status: :created, location: @boost_vibro_indicator }
      else
        format.html { render :new }
        format.json { render json: @boost_vibro_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boost_vibro_indicators/1
  # PATCH/PUT /boost_vibro_indicators/1.json
  def update
    respond_to do |format|
      if @boost_vibro_indicator.update(boost_vibro_indicator_params)
        format.html { redirect_to @boost_vibro_indicator, notice: 'Boost vibro indicator was successfully updated.' }
        format.json { render :show, status: :ok, location: @boost_vibro_indicator }
      else
        format.html { render :edit }
        format.json { render json: @boost_vibro_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boost_vibro_indicators/1
  # DELETE /boost_vibro_indicators/1.json
  def destroy
    @boost_vibro_indicator.destroy
    respond_to do |format|
      format.html { redirect_to boost_vibro_indicators_url, notice: 'Boost vibro indicator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boost_vibro_indicator
      @boost_vibro_indicator = BoostVibroIndicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boost_vibro_indicator_params
      params.require(:boost_vibro_indicator).permit(:frequency_1,
                                                    :frequency_2,
                                                    :frequency_4,
                                                    :frequency_8,
                                                    :frequency_16,
                                                    :frequency_31,
                                                    :frequency_63,
                                                    :type_axis,
                                                    :total_vibration_indicator_id)
    end
end
