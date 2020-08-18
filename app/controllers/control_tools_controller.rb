class ControlToolsController < ApplicationController
  before_action :set_control_tool, only: [:show, :edit, :update, :destroy]

  # GET /control_tools
  # GET /control_tools.json
  def index
    @control_tools = ControlTool.all
  end

  # GET /control_tools/1
  # GET /control_tools/1.json
  def show
  end

  # GET /control_tools/new
  def new
    @control_tool = ControlTool.new
  end

  # GET /control_tools/1/edit
  def edit
  end

  # POST /control_tools
  # POST /control_tools.json
  def create
    @control_tool = ControlTool.new(control_tool_params)

    respond_to do |format|
      if @control_tool.save
        format.html { redirect_to @control_tool, notice: 'Данные сохранены' }
        format.json { render :show, status: :created, location: @control_tool }
      else
        format.html { render :new }
        format.json { render json: @control_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /control_tools/1
  # PATCH/PUT /control_tools/1.json
  def update
    respond_to do |format|
      if @control_tool.update(control_tool_params)
        format.html { redirect_to @control_tool, notice: 'Данные сохранены' }
        format.json { render :show, status: :ok, location: @control_tool }
      else
        format.html { render :edit }
        format.json { render json: @control_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_tools/1
  # DELETE /control_tools/1.json
  def destroy
    @control_tool.destroy
    respond_to do |format|
      format.html { redirect_to control_tools_url, notice: 'Control tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control_tool
      @control_tool = ControlTool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_tool_params
      params.require(:control_tool).permit(:workpoint_id)
    end
end
