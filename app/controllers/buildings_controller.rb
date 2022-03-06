class BuildingsController < ApplicationController
  before_action :require_admin

  def index
    @buildings = Building.all()
  end

  def show
    @building = Building.find(params[:id])
    @error = @building
  end

  def update
    @building = Building.find(params[:id])
    @error = @building # tell _error_messages.html.erb to use this object for form errors

    if @building.update(building_params)
      logger.info("user #{current_user.id} updated building #{@building.id}")
      flash[:success] = 'building updated'
      redirect_to buildings_path
    else
      render 'show'
    end
  end

  private

    def building_params
      params.require(:building).permit(:label, :description, :image, :building_type_id)
    end
end
