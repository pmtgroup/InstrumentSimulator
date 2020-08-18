class WorkingOperationsController < ApplicationController
  before_action :set_working_operation, only: [:show, :edit, :update, :destroy]

  # GET /working_operations
  # GET /working_operations.json
  def index
    @working_operations = WorkingOperation.all
  end

  # GET /working_operations/1
  # GET /working_operations/1.json
  def show
  end

  # GET /working_operations/new
  def new
    @working_operation = WorkingOperation.new
  end

  # GET /working_operations/1/edit
  def edit
  end

  # POST /working_operations
  # POST /working_operations.json
  def create
    @working_operation = WorkingOperation.new(working_operation_params)
    respond_to do |format|
      if @working_operation.save
        format.html { redirect_to staff_worker_path(@working_operation.staff_worker_id), notice: 'Данные сохранены' }
        format.json { render :show, status: :created, location: @working_operation }
      else
        format.html { render :new }
        format.json { render json: @working_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /working_operations/1
  # PATCH/PUT /working_operations/1.json
  def update
    respond_to do |format|
      if @working_operation.update(working_operation_params)
        format.html { redirect_to @working_operation, notice: 'Working operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @working_operation }
      else
        format.html { render :edit }
        format.json { render json: @working_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_operations/1
  # DELETE /working_operations/1.json
  def destroy
    @working_operation.destroy
    respond_to do |format|
      format.html { redirect_to working_operations_url, notice: 'Working operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_operation
      @working_operation = WorkingOperation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_operation_params
      params.require(:working_operation).permit(:staff_worker_id, :date_of_operation, :duration_shift)
    end
end
