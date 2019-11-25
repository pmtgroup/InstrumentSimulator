class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @q = Person.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @check_lists = CheckList.where(person_id: @person.id)
  end

  def spirometr
    if params[:ofv1].present?
      api_spirometr(params[:pos_exhalation].to_f, params[:ofv1].to_f, params[:fgel].to_f, params[:complect_id].to_i)
    end
  end

  def glucometr
    if params[:glucose].present?
      api_glucometr(params[:glucose].to_f, params[:complect_id].to_i)
    end
  end


  def api_spirometr(pos_exhalation, ofv1, fgel, complect_id)
    require 'net/http'
    require 'uri'
    require 'json'
    if pos_exhalation.present?

      body_msg     = "{\"pos_exhalation\":#{pos_exhalation},\"ofv1\":\"#{ofv1}\",\"fgel\":#{fgel},\"complect_id\":#{complect_id}}"
      # body_msg     = "pos_exhalation=#{pos_exhalation}&ofv1=#{ofv1}&fgel=#{fgel}&complect_id=#{complect_id}"
      # raise body_msg.inspect
      # raise body_msg.inspect
      uri          = URI.parse("http://test.pmtlogin.ru/api/spiroment")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      # raise request.body.inspect
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end

      # result = JSON.parse(response.body)
      # raise result ["status"].inspect
      redirect_to spirometr_person_path("test"), notice: 'Данные переданы'
    else
      redirect_to spirometr_person_path("test"), notice: 'Ошибка в данных'
    end
  end

  def api_glucometr(glucose, complect_id)
    require 'net/http'
    require 'uri'
    require 'json'
    if glucose.present?

      body_msg     = "{\"glucose\":#{glucose},\"complect_id\":#{complect_id}}"
      # body_msg     = "pos_exhalation=#{pos_exhalation}&ofv1=#{ofv1}&fgel=#{fgel}&complect_id=#{complect_id}"
      # raise body_msg.inspect
      # raise body_msg.inspect
      uri          = URI.parse("http://test.pmtlogin.ru/api/blood_glucose_meter")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      # raise request.body.inspect
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end

      # result = JSON.parse(response.body)
      # raise result ["status"].inspect
      redirect_to glucometr_person_path("test"), notice: 'Данные переданы'
    else
      redirect_to glucometr_person_path("test"), notice: 'Ошибка в данных'
    end
  end
  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Клиент создан' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Данные клиента обновлены.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Клиент удален из базы.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :second_name, :patronymic, :sex, :contact_phone,
        :mark_car, :model_car, :number_car, :last_visit, :description, :comment)
    end
end
