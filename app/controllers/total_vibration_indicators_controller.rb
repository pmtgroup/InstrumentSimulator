class TotalVibrationIndicatorsController < ApplicationController
  before_action :set_total_vibration_indicator, only: [:show, :edit, :update, :destroy]

  # GET /total_vibration_indicators
  # GET /total_vibration_indicators.json
  def index
    @total_vibration_indicators = TotalVibrationIndicator.all
  end

  # GET /total_vibration_indicators/1
  # GET /total_vibration_indicators/1.json
  def show
    @x_values = BoostVibroIndicator.where(total_vibration_indicator_id:@total_vibration_indicator.id, type_axis: 1).last
    @y_values = BoostVibroIndicator.where(total_vibration_indicator_id:@total_vibration_indicator.id, type_axis: 2).last
    @z_values = BoostVibroIndicator.where(total_vibration_indicator_id:@total_vibration_indicator.id, type_axis: 3).last
  end

  # GET /total_vibration_indicators/new
  def new
    # @total_vibration_indicator = TotalVibrationIndicator.new
    # raise params.inspect
    if params[:vibrations] != nil
      create_vibration(params[:vibrations])
    end
  end

  # GET /total_vibration_indicators/1/edit
  def edit
  end

  def create_vibration(params)
    @total = TotalVibrationIndicator.create!(terms: params[:terms],
                                    boost_level_x: params[:boost_level_x],
                                    boost_level_y: params[:boost_level_y],
                                    boost_level_z: params[:boost_level_z],
                                    staff_worker_id: params[:staff_worker_id],
                                    working_operation_id: params[:working_operation_id])
    @total.save!
    @x_values = BoostVibroIndicator.create!(frequency_1: params[:values_x][:frequency_1_x],
                                            frequency_2: params[:values_x][:frequency_2_x],
                                            frequency_4: params[:values_x][:frequency_4_x],
                                            frequency_8: params[:values_x][:frequency_8_x],
                                            frequency_16: params[:values_x][:frequency_16_x],
                                            frequency_31: params[:values_x][:frequency_31_x],
                                            frequency_63: params[:values_x][:frequency_63_x],
                                            type_axis: params[:values_x][:type_axis_x],
                                            total_vibration_indicator_id: @total.id)
    @y_values = BoostVibroIndicator.create!(frequency_1: params[:values_y][:frequency_1_y],
                                            frequency_2: params[:values_y][:frequency_2_y],
                                            frequency_4: params[:values_y][:frequency_4_y],
                                            frequency_8: params[:values_y][:frequency_8_y],
                                            frequency_16: params[:values_y][:frequency_16_y],
                                            frequency_31: params[:values_y][:frequency_31_y],
                                            frequency_63: params[:values_y][:frequency_63_y],
                                            type_axis: params[:values_y][:type_axis_y],
                                            total_vibration_indicator_id: @total.id)

    @z_values = BoostVibroIndicator.create!(frequency_1: params[:values_z][:frequency_1_z],
                                            frequency_2: params[:values_z][:frequency_2_z],
                                            frequency_4: params[:values_z][:frequency_4_z],
                                            frequency_8: params[:values_z][:frequency_8_z],
                                            frequency_16: params[:values_z][:frequency_16_z],
                                            frequency_31: params[:values_z][:frequency_31_z],
                                            frequency_63: params[:values_z][:frequency_63_z],
                                            type_axis: params[:values_z][:type_axis_z],
                                            total_vibration_indicator_id: @total.id)
    @x_values.save!
    @y_values.save!
    @z_values.save!
    respond_to do |format|
        format.html { redirect_to staff_worker_path(@total.staff_worker_id), notice: 'Данные сохранены' }
        format.json { render :show, status: :created, location: @total_vibration_indicator }
    end

  end
  # POST /total_vibration_indicators
  # POST /total_vibration_indicators.json
  def create
    @total_vibration_indicator = TotalVibrationIndicator.new(total_vibration_indicator_params)

    respond_to do |format|
      if @total_vibration_indicator.save
        format.html { redirect_to @total_vibration_indicator, notice: 'Total vibration indicator was successfully created.' }
        format.json { render :show, status: :created, location: @total_vibration_indicator }
      else
        format.html { render :new }
        format.json { render json: @total_vibration_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /total_vibration_indicators/1
  # PATCH/PUT /total_vibration_indicators/1.json
  def update
    respond_to do |format|
      if @total_vibration_indicator.update(total_vibration_indicator_params)
        format.html { redirect_to @total_vibration_indicator, notice: 'Total vibration indicator was successfully updated.' }
        format.json { render :show, status: :ok, location: @total_vibration_indicator }
      else
        format.html { render :edit }
        format.json { render json: @total_vibration_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /total_vibration_indicators/1
  # DELETE /total_vibration_indicators/1.json
  def destroy
    @total_vibration_indicator.destroy
    respond_to do |format|
      format.html { redirect_to total_vibration_indicators_url, notice: 'Total vibration indicator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total_vibration_indicator
      @total_vibration_indicator = TotalVibrationIndicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def total_vibration_indicator_params
      params.require(:total_vibration_indicator).permit(:terms,
                                                        :boost_level_x,
                                                        :boost_level_y,
                                                        :boost_level_z,
                                                        :staff_worker_id,
                                                        :working_operation_id)
    end





end
