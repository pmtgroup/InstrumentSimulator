class StaffWorkersController < ApplicationController
  before_action :set_staff_worker, only: [:show, :edit, :update, :destroy]

  # GET /staff_workers
  # GET /staff_workers.json
  def index
    @staff_workers = StaffWorker.all
  end

  # GET /staff_workers/1
  # GET /staff_workers/1.json
  def show
  end

  # GET /staff_workers/new
  def new
    @staff_worker = StaffWorker.new
  end

  # GET /staff_workers/1/edit
  def edit
  end

  # POST /staff_workers
  # POST /staff_workers.json
  def create
    @staff_worker = StaffWorker.new(staff_worker_params)

    respond_to do |format|
      if @staff_worker.save
        format.html { redirect_to @staff_worker, notice: 'Staff worker was successfully created.' }
        format.json { render :show, status: :created, location: @staff_worker }
      else
        format.html { render :new }
        format.json { render json: @staff_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_workers/1
  # PATCH/PUT /staff_workers/1.json
  def update
    respond_to do |format|
      if @staff_worker.update(staff_worker_params)
        format.html { redirect_to @staff_worker, notice: 'Staff worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff_worker }
      else
        format.html { render :edit }
        format.json { render json: @staff_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_workers/1
  # DELETE /staff_workers/1.json
  def destroy
    @staff_worker.destroy
    respond_to do |format|
      format.html { redirect_to staff_workers_url, notice: 'Staff worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_worker
      @staff_worker = StaffWorker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_worker_params
      params.require(:staff_worker).permit(:name, :surname, :patronymic, :subdivision_id, :birthday, :position, :duration_work, :labor_activity_type, :labor_activity_category, :duration_one_shift, :workplace_id, :work_in_workplace, :description_operation,:additional_workplace_id, :additional_work_in_workplace, :additional_description_operation)
    end
end
