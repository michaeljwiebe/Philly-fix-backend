class UsersController < ApplicationController
  def index
      user = User.where(params[:email]).first
      if user.password === params[:password]
        session[user_id] = user.id
        render json: user
      end
  end

  def show
  end

  def create
      user = User.new(user_params)
      if user.save!
          session[:user_id] = user.id
          render json: user
      end
  end

  def update
  end

  def destroy
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
