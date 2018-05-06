class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = Server.find(params[:id])
    @monitorings = @server.monitorings
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  # POST /servers.json
  def create
    @project = Project.find(params[:project_id])
    @server = @project.servers.build(server_params)

    respond_to do |format|
      if @server.save
        flash[:success] = "Server was successfully created."
        format.html { redirect_to @project}
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    @project = current_project
    respond_to do |format|
      if @server.update(server_params)
        flash[:success] = "Server was successfully updated."
        format.html { redirect_to @project }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @project = current_project
    @server.destroy
    respond_to do |format|
      flash[:success] = "Server was successfully destroy."
      format.html { redirect_to @project}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    def current_project
      Project.find(@server.project_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:name, :serial_number, :type, :os, :ip_address, :application)
    end
end
