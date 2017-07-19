class SubscribeControllersController < ApplicationController
  before_action :set_subscribe_controller, only: [:show, :update, :destroy]

  # GET /subscribe_controllers
  def index
    @subscribe_controllers = SubscribeController.all

    render json: @subscribe_controllers
  end

  # GET /subscribe_controllers/1
  def show
    render json: @subscribe_controller
  end

  # POST /subscribe_controllers
  def create
    @subscribe_controller = SubscribeController.new(subscribe_controller_params)

    if @subscribe_controller.save
      render json: @subscribe_controller, status: :created, location: @subscribe_controller
    else
      render json: @subscribe_controller.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subscribe_controllers/1
  def update
    if @subscribe_controller.update(subscribe_controller_params)
      render json: @subscribe_controller
    else
      render json: @subscribe_controller.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscribe_controllers/1
  def destroy
    @subscribe_controller.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribe_controller
      @subscribe_controller = SubscribeController.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscribe_controller_params
      params.fetch(:subscribe_controller, {})
    end
end
