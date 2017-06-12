class Admin::SessionsController < Admin::BaseController
  skip_before_action :admin_authenticate,:except => :dashboard
  def new

  end

  def create
    user = User.find_by(email:params[:email]).try(:authenticate,params[:password])
    if user
      session[:admin_id] = user.id
      redirect_to admin_dashboard_path
    else

      redirect_to new_admin_session_path, :alert=>"check email adn password"
    end

  end

  def destroy
    session[:admin_id] = nil
    redirect_to new_admin_sessions_path

  end
  def dashboard

  end
  private
  def user_params
    params.require(:session).permit(:email, :password)
  end


end
