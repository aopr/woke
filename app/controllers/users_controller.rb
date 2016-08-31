class UsersController < ApplicationController
  def new

  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
  end
end
  end










  private
    def user_params
      params.require(:user).permit(:u_name, :email, :password, :password_confirmation, :google_auth_token)
    end
end
