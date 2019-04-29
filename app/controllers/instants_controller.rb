class InstantsController < ApplicationController
  before_action :require_admin

  def index
    @instants = Instant.all()
  end

  def show
    @instant = Instant.find(params[:id])
    @error = @instant
  end

  def update
    @instant = Instant.find(params[:id])
    @error = @instant # tell _error_messages.html.erb to use this object for form errors

    if @instant.update_attributes(instant_params)
      logger.info("user #{current_user.id} updated instant #{@instant.id}")
      flash[:success] = 'instant updated'
      index
      redirect_to instants_path
    else
      render 'show'
    end
  end

  private
  def instant_params
    params.require(:instant).permit(:instant)
  end
end
