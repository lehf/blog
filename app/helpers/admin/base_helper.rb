module Admin::BaseHelper

  def current_admin
    session[:admin_id] ? User.find(session[:admin_id]) : nil
  end
end
