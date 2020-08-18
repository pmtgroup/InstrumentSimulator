class LocalVibFIndicatorsController < ApplicationController
  before_action :set_local_vib_f_indicator, only: [:show, :edit, :update, :destroy]

  # GET /local_vib_f_indicators
  # GET /local_vib_f_indicators.json
  def index
    @local_vib_f_indicators = LocalVibFIndicator.all
  end

  # GET /local_vib_f_indicators/1
  # GET /local_vib_f_indicators/1.json
  def show
    @x_values = BoostVibLInd.where(local_vib_f_indicator_id:@local_vib_f_indicator.id, type_axis: 1).last
    @y_values = BoostVibLInd.where(local_vib_f_indicator_id:@local_vib_f_indicator.id, type_axis: 2).last
    @z_values = BoostVibLInd.where(local_vib_f_indicator_id:@local_vib_f_indicator.id, type_axis: 3).last
  end

  # GET /local_vib_f_indicators/new
  def new
    if params[:vibrations] != nil
      create_vibration(params[:vibrations])
    end
  end

  # GET /local_vib_f_indicators/1/edit
  def edit
  end


  def create_vibration(params)
    @local = LocalVibFIndicator.create!(terms: params[:terms],
                                    boost_level_x: params[:boost_level_x],
                                    boost_level_y: params[:boost_level_y],
                                    boost_level_z: params[:boost_level_z],
                                    staff_worker_id: params[:staff_worker_id],
                                    working_operation_id: params[:working_operation_id])
    @local.save!
    @x_values = BoostVibLInd.create!(       frequency_8: params[:values_x][:frequency_8_x],
                                            frequency_16: params[:values_x][:frequency_16_x],
                                            frequency_31: params[:values_x][:frequency_31_x],
                                            frequency_63: params[:values_x][:frequency_63_x],
                                            frequency_125: params[:values_x][:frequency_125_x],
                                            frequency_250: params[:values_x][:frequency_250_x],
                                            frequency_500: params[:values_x][:frequency_500_x],
                                            frequency_1000: params[:values_x][:frequency_1000_x],
                                            type_axis: params[:values_x][:type_axis_x],
                                            local_vib_f_indicator_id: @local.id)

    @y_values = BoostVibLInd.create!(       frequency_8: params[:values_y][:frequency_8_y],
                                            frequency_16: params[:values_y][:frequency_16_y],
                                            frequency_31: params[:values_y][:frequency_31_y],
                                            frequency_63: params[:values_y][:frequency_63_y],
                                            frequency_125: params[:values_y][:frequency_125_y],
                                            frequency_250: params[:values_y][:frequency_250_y],
                                            frequency_500: params[:values_y][:frequency_500_y],
                                            frequency_1000: params[:values_y][:frequency_1000_y],
                                            type_axis: params[:values_y][:type_axis_y],
                                            local_vib_f_indicator_id: @local.id)

    @z_values = BoostVibLInd.create!(       frequency_8: params[:values_z][:frequency_8_z],
                                            frequency_16: params[:values_z][:frequency_16_z],
                                            frequency_31: params[:values_z][:frequency_31_z],
                                            frequency_63: params[:values_z][:frequency_63_z],
                                            frequency_125: params[:values_z][:frequency_125_z],
                                            frequency_250: params[:values_z][:frequency_250_z],
                                            frequency_500: params[:values_z][:frequency_500_z],
                                            frequency_1000: params[:values_z][:frequency_1000_z],
                                            type_axis: params[:values_z][:type_axis_z],
                                            local_vib_f_indicator_id: @local.id)
    @x_values.save!
    @y_values.save!
    @z_values.save!
    respond_to do |format|
        format.html { redirect_to staff_worker_path(@local.staff_worker_id), notice: 'Данные сохранены' }
        format.json { render :show, status: :created, location: @total_vibration_indicator }
    end

  end
  # POST /local_vib_f_indicators
  # POST /local_vib_f_indicators.json
  def create
    @local_vib_f_indicator = LocalVibFIndicator.new(local_vib_f_indicator_params)

    respond_to do |format|
      if @local_vib_f_indicator.save
        format.html { redirect_to @local_vib_f_indicator, notice: 'Local vib f indicator was successfully created.' }
        format.json { render :show, status: :created, location: @local_vib_f_indicator }
      else
        format.html { render :new }
        format.json { render json: @local_vib_f_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_vib_f_indicators/1
  # PATCH/PUT /local_vib_f_indicators/1.json
  def update
    respond_to do |format|
      if @local_vib_f_indicator.update(local_vib_f_indicator_params)
        format.html { redirect_to @local_vib_f_indicator, notice: 'Local vib f indicator was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_vib_f_indicator }
      else
        format.html { render :edit }
        format.json { render json: @local_vib_f_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_vib_f_indicators/1
  # DELETE /local_vib_f_indicators/1.json
  def destroy
    @local_vib_f_indicator.destroy
    respond_to do |format|
      format.html { redirect_to local_vib_f_indicators_url, notice: 'Local vib f indicator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_vib_f_indicator
      @local_vib_f_indicator = LocalVibFIndicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_vib_f_indicator_params
      params.require(:local_vib_f_indicator).permit(:terms,
                                                    :boost_level_x,
                                                    :boost_level_y,
                                                    :boost_level_z,
                                                    :staff_worker_id,
                                                    :working_operation_id)
    end
end
