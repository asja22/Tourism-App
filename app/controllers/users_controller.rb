class UsersController < ApplicationController
  
  def show
    if current_user
      @user = User.find(params[:id])
    end
  end
  
end