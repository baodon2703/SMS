class MonitoringsController < ApplicationController
  before_action :set_monitoring, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  # GET /monitorings
  # GET /monitorings.json
  def index
    @monitorings = Monitoring.all
  end

  # GET /monitorings/1
  # GET /monitorings/1.json
  def show
  end

  # GET /monitorings/new
  def new
    @monitoring = Monitoring.new
  end

  # GET /monitorings/1/edit
  def edit
  end

  # POST /monitorings
  # POST /monitorings.json
  def create
    @server = Server.find(params[:server_id])
    @monitoring = @server.monitorings.build(monitoring_params)

    respond_to do |format|
      if @monitoring.save
        flash[:success] = "Monitoring was successfully created."
        format.html { redirect_to @monitoring}
        format.json { render :show, status: :created, location: @monitoring }
      else
        format.html { render :new }
        format.json { render json: @monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monitorings/1
  # PATCH/PUT /monitorings/1.json
  def update
    @server = current_server
    respond_to do |format|
      if @monitoring.update(monitoring_params)
        flash[:success] = "Monitoring was successfully updated."
        format.html { redirect_to @server}
        format.json { render :show, status: :ok, location: @monitoring }
      else
        format.html { render :edit }
        format.json { render json: @monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitorings/1
  # DELETE /monitorings/1.json
  def destroy
    @server = current_server
    @monitoring.destroy
    respond_to do |format|
      flash[:success] = "Monitoring was successfully destroy."
      format.html { redirect_to }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitoring
      @monitoring = Monitoring.find(params[:id])
    end

    def current_server
      Server.find(@monitoring.server_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monitoring_params
      params.require(:monitoring).permit(:name, :content, :warning, :critical, :failure_flow, :interval, :retry_num, :timeout, :route, :other, :tool)
    end
end
