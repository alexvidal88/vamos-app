class ParametersController < ApplicationController
  before_action :set_parameter, only: [:show, :destroy]
  def index
    @parameters = Parameter.all
  end

  def new
    @parameter = Parameter.new
  end

  def show
  end

  def create
    @parameter = Parameter.new(parameter_params)
    @parameter.save
    redirect_to new_parameter_path
  end

  def destroy
    @parameter.destroy
    redirect_to parameters_path
  end

  private

  def parameter_params
    params.require(:parameter).permit(:weather_parameter, :weather_key, :activity_type)
  end

  def set_parameter
    @parameter = Parameter.find(params[:id])
  end
end
