class EmailLogsController < ApplicationController
  before_action :require_admin

  def tier_email_logs
    @logs = EmailLog.where(tier: params[:id]).all
  end

  def tier_email_logs_all
    @logs = EmailLog.all
    render 'tier_email_logs'
  end
end
