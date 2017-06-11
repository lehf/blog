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
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params.delete(:password) if params[:password].blank?
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
    else
      redirect_to admin_users_path
    end

  end
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:is_admin)
  end
end
