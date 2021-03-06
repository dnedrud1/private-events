class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Profile created!"
      redirect_to @user
    else
      flash.now[:error] = "Signup invalid"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
