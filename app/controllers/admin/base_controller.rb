class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  private

  def authenticate_admin!
    redirect_to root_path, alert: "You don't have permissions to access this resource." unless current_user.admin?
  end
end

