class RegistrationsController < ApplicationController
  before_action :require_admin

  def index
    @registrations = User.search(params).order(sort).page(params[:page]).per(20)
  end

  def sort
    if (User.column_names.include?(params[:sort]) && %w[asc desc].include?(params[:direction]))
      "#{params[:sort]} #{params[:direction]}, name"
    else
      :name
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
