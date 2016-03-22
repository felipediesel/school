class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :users, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      sign_in @user, bypass: true if current_user.id == @user.id
      redirect_to :users, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @user == current_user
      redirect_to users_url, error: 'Current user cannot be destroyed.'
    else
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      permit_params = [:name, :email]
      permit_params.push(:password, :password_confirmation) if params[:user][:password].present?

      params.require(:user).permit(permit_params)
    end
end
