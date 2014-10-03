class UserIdentitiesController < ApplicationController
  def new
    @user = User.new
  end
  
  def confirm
    @user = User.new new_user  
  end
  
  def create
    @user = User.new new_user
    @user.setting_password = true
    @user.checked = true
    @user.created = true
    if @user.save
      ui = UserIdentity.create!(
        :user => @user,
        :provider => session[:omniauth_provider],
        :uid => session[:omniauth_uid],
        :info => session[:omniauth_info]
      )
      ui.user.emails << Email.new(address: params[:user][:emails], main: true)
      session.delete(:omniauth_provider)
      session.delete(:omniauth_uid)
      session.delete(:omniauth_info)
      session[:current_user_id] = ui.user_id
      ui.user.update_column(:logged_at, Time.current)
      redirect_to :root
    else
      render action: :new
    end
  end
  
  private
  def new_user
    params.require(:user).permit(
      :display_name, 
      :login_name, 
      :password, 
      :password_confirmation,
      :new_user_name,
      :select_user_name)
  end
end