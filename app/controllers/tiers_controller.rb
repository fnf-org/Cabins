class TiersController < ApplicationController
  before_action :require_admin

  def index
    @tiers = Tier.all()
  end

  def show
    @tier = Tier.find(params[:id])
    @error = @tier
  end

  def update
    @tier = Tier.find(params[:id])
    @error = @tier # tell _error_messages.html.erb to use this object for form errors

    if @tier.update_attributes(tier_params)
      flash[:success] = 'tier updated'
      index
      redirect_to tiers_path
    else
      render 'show'
    end
  end

  private
    def tier_params
      params.require(:tier).permit(:label, :description, :available)
    end
end
