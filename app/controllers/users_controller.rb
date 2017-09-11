class UsersController < ApplicationController
  def new
    user = User.new
    render locals: { user: user }
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "Thank you for registering"
    else
      render :new, locals: {user: user}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
