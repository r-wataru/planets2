class UsersController < ApplicationController
  def index
    @users = User.order("number ASC")
  end

  def show
    @user = User.find(params[:id])
  end
end