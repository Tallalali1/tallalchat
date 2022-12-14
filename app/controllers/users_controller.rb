class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show

  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end


  def new
    @user = User.new
  end


  def edit

  end

  def update

    if @user.update(user_params)
      flash[:success] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}, you have successfully signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:success] = "Account and all associated articles successfully deleted"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end

end