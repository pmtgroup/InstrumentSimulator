class RegisterSignalsController < ApplicationController
  before_action :set_register_signal, only: [:show, :edit, :update, :destroy]

  # GET /register_signals
  # GET /register_signals.json
  def index
    @register_signals = RegisterSignal.all
  end

  # GET /register_signals/1
  # GET /register_signals/1.json
  def show
  end

  # GET /register_signals/new
  def new
    @register_signal = RegisterSignal.new
  end

  # GET /register_signals/1/edit
  def edit
  end

  # POST /register_signals
  # POST /register_signals.json
  def create
    @register_signal = RegisterSignal.new(register_signal_params)

    respond_to do |format|
      if @register_signal.save
        format.html { redirect_to @register_signal, notice: 'Данные сохранены' }
        format.json { render :show, status: :created, location: @register_signal }
      else
        format.html { render :new }
        format.json { render json: @register_signal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_signals/1
  # PATCH/PUT /register_signals/1.json
  def update
    respond_to do |format|
      if @register_signal.update(register_signal_params)
        format.html { redirect_to @register_signal,notice: 'Данные сохранены' }
        format.json { render :show, status: :ok, location: @register_signal }
      else
        format.html { render :edit }
        format.json { render json: @register_signal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_signals/1
  # DELETE /register_signals/1.json
  def destroy
    @register_signal.destroy
    respond_to do |format|
      format.html { redirect_to register_signals_url, notice: 'Register signal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_signal
      @register_signal = RegisterSignal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_signal_params
      params.require(:register_signal).permit(:number_register, :control_tool_id)
    end
end
