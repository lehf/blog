class Admin::BaseController < ApplicationController
  before_action :admin_authenticate

  def current_admin
    session[:id] ? User.find(session[:admin_id]) : nil
  end

  private
  def admin_authenticate
    unless session[:admin_id]
      redirect_to new_admin_session_path, :alert => "UnLogin"
    end
  end
end