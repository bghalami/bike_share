class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.email.downcase!

    if @user.save
      flash[:notice] = "Welcome to Bike Share #{@user.name}"
      session[:user_id] = @user.id

      redirect_to :dashboard
    else
      flash.now.alert = "Please try again."
      render :new
    end
  end

  def edit
    if User.find_by_id(params[:id]) != nil
      @user = User.find(params[:id])
      if @user == current_user
        render :edit
      else
        render file: "/public/404"
      end
    else
      render file: "/public/404"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to dashboard_path
  end

  def dashboard
    @user = current_user
    @orders = @user.orders
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
