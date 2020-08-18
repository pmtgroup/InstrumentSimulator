class BoostVibLsIndsController < ApplicationController
  before_action :set_boost_vib_ls_ind, only: [:show, :edit, :update, :destroy]

  # GET /boost_vib_ls_inds
  # GET /boost_vib_ls_inds.json
  def index
    @boost_vib_ls_inds = BoostVibLsInd.all
  end

  # GET /boost_vib_ls_inds/1
  # GET /boost_vib_ls_inds/1.json
  def show
  end

  # GET /boost_vib_ls_inds/new
  def new
    @boost_vib_ls_ind = BoostVibLsInd.new
  end

  # GET /boost_vib_ls_inds/1/edit
  def edit
  end

  # POST /boost_vib_ls_inds
  # POST /boost_vib_ls_inds.json
  def create
    @boost_vib_ls_ind = BoostVibLsInd.new(boost_vib_ls_ind_params)

    respond_to do |format|
      if @boost_vib_ls_ind.save
        format.html { redirect_to @boost_vib_ls_ind, notice: 'Boost vib ls ind was successfully created.' }
        format.json { render :show, status: :created, location: @boost_vib_ls_ind }
      else
        format.html { render :new }
        format.json { render json: @boost_vib_ls_ind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boost_vib_ls_inds/1
  # PATCH/PUT /boost_vib_ls_inds/1.json
  def update
    respond_to do |format|
      if @boost_vib_ls_ind.update(boost_vib_ls_ind_params)
        format.html { redirect_to @boost_vib_ls_ind, notice: 'Boost vib ls ind was successfully updated.' }
        format.json { render :show, status: :ok, location: @boost_vib_ls_ind }
      else
        format.html { render :edit }
        format.json { render json: @boost_vib_ls_ind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boost_vib_ls_inds/1
  # DELETE /boost_vib_ls_inds/1.json
  def destroy
    @boost_vib_ls_ind.destroy
    respond_to do |format|
      format.html { redirect_to boost_vib_ls_inds_url, notice: 'Boost vib ls ind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boost_vib_ls_ind
      @boost_vib_ls_ind = BoostVibLsInd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boost_vib_ls_ind_params
      params.require(:boost_vib_ls_ind).permit(:frequency_8,
                                              :frequency_16,
                                              :frequency_31,
                                              :frequency_63,
                                              :frequency_125,
                                              :frequency_250,
                                              :frequency_500,
                                              :frequency_1000,
                                              :type_axis,
                                              :local_vib_s_indicator_id)
    end
end
