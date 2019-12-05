class PeopleController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
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

  def ad
    if params[:systolic_bp].present?
      api_ad(params[:systolic_bp].to_i, params[:diastolic_bp].to_i, params[:complect_id].to_i)
    end
  end

  def heart_rate
    if params[:heart_rate].present?
      api_heart_rate(params[:heart_rate].to_i, params[:complect_id].to_i)
    end
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

  def weigher
    if params[:weight].present?
      api_weigher(params[:weight].to_f, params[:complect_id].to_i)
    end
  end

  def vibrotester
    if params[:hr63].present?
      api_vibrotester(params)
    end
  end

  def audiometer
    if params[:ac_250_right].present?
      api_audiometer(params)
    end
  end

  def api_ad(systolic_bp, diastolic_bp, complect_id)
    if systolic_bp.present?
      body_msg     = "{\"systolic_bp\":#{systolic_bp},\"diastolic_bp\":\"#{diastolic_bp}\",\"complect_id\":#{complect_id}}"
      uri          = URI.parse("http://localhost:3000/api/ad")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
      result = JSON.parse(response.body)
      redirect_to ad_person_path("test"), notice: "#{result["status"]} #{result["message"]}"
    else
      redirect_to ad_person_path("test"), notice: 'Ошибка в данных'
    end
  end

  def api_heart_rate(heart_rate, complect_id)
    if heart_rate.present?
      body_msg     = "{\"heart_rate\":#{heart_rate},\"complect_id\":#{complect_id}}"
      uri          = URI.parse("http://localhost:3000/api/heart_rate")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
      result = JSON.parse(response.body)
      redirect_to heart_rate_person_path("test"), notice: "#{result["status"]} #{result["message"]}"
    else
      redirect_to heart_rate_person_path("test"), notice: 'Ошибка в данных'
    end
  end

  def api_spirometr(pos_exhalation, ofv1, fgel, complect_id)
    if pos_exhalation.present?
      body_msg     = "{\"pos_exhalation\":#{pos_exhalation},\"ofv1\":\"#{ofv1}\",\"fgel\":#{fgel},\"complect_id\":#{complect_id}}"
      uri          = URI.parse("http://test.pmtlogin.ru/api/spiroment")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
      result = JSON.parse(response.body)
      redirect_to spirometr_person_path("test"), notice: "#{result["status"]} #{result["message"]}"
    else
      redirect_to spirometr_person_path("test"), notice: 'Ошибка в данных'
    end
  end

  def api_glucometr(glucose, complect_id)
    if glucose.present?
      body_msg     = "{\"glucose\":#{glucose},\"complect_id\":#{complect_id}}"
      uri          = URI.parse("http://localhost:3000/api/blood_glucose_meter")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
      result = JSON.parse(response.body)
      redirect_to glucometr_person_path("test"), notice: "#{result["status"]} #{result["message"]}"
    else
      redirect_to glucometr_person_path("test"), notice: 'Ошибка в данных'
    end
  end

  def api_weigher(weight, complect_id)
    if weight.present?
      body_msg     = "{\"weight\":#{weight},\"complect_id\":#{complect_id}}"
      uri          = URI.parse("http://localhost:3000/api/weigher")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
      result = JSON.parse(response.body)
      redirect_to weigher_person_path("test"), notice: "#{result["status"]} #{result["message"]}"
    else
      redirect_to weigher_person_path("test"), notice: 'Ошибка в данных'
    end
  end

  def api_vibrotester(params)
    if params[:hr63].present?
      body_msg     = "{\"hr63\":#{params[:hr63]},\"hr125\":#{params[:hr125]},\"hr250\":#{params[:hr250]},\"hl63\":#{params[:hl63]},\"hl125\":#{params[:hl125]},\"hl250\":#{params[:hl250]},\"fr125\":#{params[:fr125]},\"fl125\":#{params[:fl125]},\"complect_id\":#{params[:complect_id]}}"
      uri          = URI.parse("http://test.pmtlogin.ru/api/vibrotester")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
      result = JSON.parse(response.body)
      redirect_to vibrotester_person_path("test"), notice: "#{result["status"]} #{result["message"]}"
    else
      redirect_to vibrotester_person_path("test"), notice: 'Ошибка в данных'
    end
  end

  def api_audiometer(params)
    if params[:ac_250_right].present?
      body_msg     = "{\"ac_250_right\":#{params[:ac_250_right]},\"ac_500_right\":#{params[:ac_500_right]},\"ac_1000_right\":#{params[:ac_1000_right]},\"ac_2000_right\":#{params[:ac_2000_right]},\"ac_4000_right\":#{params[:ac_4000_right]},\"ac_250_left\":#{params[:ac_250_left]},\"ac_500_left\":#{params[:ac_500_left]},\"ac_1000_left\":#{params[:ac_1000_left]},\"ac_2000_left\":#{params[:ac_2000_left]},\"ac_4000_left\":#{params[:ac_4000_left]},\"complect_id\":#{params[:complect_id]}}"
      uri          = URI.parse("http://test.pmtlogin.ru/api/audiometer")
      request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body_msg
      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
      result = JSON.parse(response.body)
      redirect_to audiometer_person_path("test"), notice: "#{result["status"]} #{result["message"]}"
    else
      redirect_to audiometer_person_path("test"), notice: 'Ошибка в данных'
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
