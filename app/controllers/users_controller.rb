class UsersController < ApplicationController
  def index
    @users = User.order("number ASC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @user_form = UserForm.new(User.find(params[:id]))
  end

  def update
    redirect_to :back
  end

  private
  def user_params

  end
end