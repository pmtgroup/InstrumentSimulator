class WorkpointsController < ApplicationController
  before_action :set_workpoint, only: [:show, :edit, :update, :destroy]

  # GET /workpoints
  # GET /workpoints.json
  def index
    @q = Workpoint.eager_load(:workplace => {:subdivision => :company}).ransack(params[:q])
    @workpoints = @q.result(distinct: true)
    # @workpoints = Workpoint.all
  end

  # GET /workpoints/1
  # GET /workpoints/1.json
  def show
  end

  # GET /workpoints/new
  def new
    @workpoint = Workpoint.new
  end

  # GET /workpoints/1/edit
  def edit
  end

  # POST /workpoints
  # POST /workpoints.json
  def create
    @workpoint = Workpoint.new(workpoint_params)
    @workpoint.uniq_number_id = "#{Company.where(id: Subdivision.where(id: Workplace.find(@workpoint.workplace_id).subdivision_id).last.company_id).last.number_id}" + "#{Subdivision.where(id: Workplace.find(@workpoint.workplace_id).subdivision_id).last.number_id}" + "#{Workplace.find(@workpoint.workplace_id).number_id}" + "#{@workpoint.number_id}"
    respond_to do |format|
      if @workpoint.save
        format.html { redirect_to @workpoint, notice: 'Данные сохранены' }
        format.json { render :show, status: :created, location: @workpoint }
      else
        format.html { render :new }
        format.json { render json: @workpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workpoints/1
  # PATCH/PUT /workpoints/1.json
  def update
    respond_to do |format|
      if @workpoint.update(workpoint_params)
        format.html { redirect_to @workpoint, notice: 'Данные сохранены' }
        format.json { render :show, status: :ok, location: @workpoint }
      else
        format.html { render :edit }
        format.json { render json: @workpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workpoints/1
  # DELETE /workpoints/1.json
  def destroy
    @workpoint.destroy
    respond_to do |format|
      format.html { redirect_to workpoints_url, notice: 'Workpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workpoint
      @workpoint = Workpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workpoint_params
      params.require(:workpoint).permit(:name, :description, :type_vpf, :workplace_id, :description_file, :number_id, :uniq_number_id)
    end
end
