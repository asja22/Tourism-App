class UsersController < ApplicationController
  
  def index
    if current_admin
      @user = User.all
    else
      redirect_to root_path
    end
  end
  
  def show
      @user = User.find(params[:id])
  end
  
end