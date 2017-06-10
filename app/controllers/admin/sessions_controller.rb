class Admin::SessionsController < ApplicationController
  def new

  end

  def create
    redirect_to new_admin_sessions_path
  end

  def destroy

  end
end
