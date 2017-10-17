class UsersController < ApplicationController

  def index
  end


  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "You are now registered."
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
