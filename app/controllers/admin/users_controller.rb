class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:is_admin)
  end
end
