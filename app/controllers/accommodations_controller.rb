class AccommodationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :require_admin, except: [:index]
  before_action :logged_in_user
  before_action :purge_expired_reservations

  def index
    logger.info("params: #{params.inspect}")
    @lodgings = Accommodation.search(params, is_admin?).order(sort).page(params[:page]).per(10)
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    @error = @accommodation
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    @error = @accommodation # tell _error_messages.html.erb to use this object for form errors

    if @accommodation.update_attributes(accommodation_params)
      flash[:success] = 'accommodation updated'
      redirect_to building_path(@accommodation.building)
    else
      render 'show'
    end
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:accommodation_type, :air_conditioning, :hold, :bathroom,
                                          :description, :kitchen, :label, :occupancy, :price, :quantity,
                                          :column, :available
    ) end

  def sort
    if (Accommodation.column_names.include?(params[:sort]) && %w[asc desc].include?(params[:direction]))
      "#{params[:sort]} #{params[:direction]}, label"
    else
      :label
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
