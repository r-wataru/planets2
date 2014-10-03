class UserIdentitiesController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
    @user = User.new new_user
    if @user.invalid?
      render action: :new
    end
  end

  def create
    @user = User.new new_user
    if AdminPasswordAuthenticator.verify(params[:login_name], params[:password])
      if @user.new_user_name == "1"
        @user.setting_password = true
      else
        @user = User.find_by(id: @user.select_user_name)
      end
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
        flash.notice = "完了しました。"
        redirect_to :root
      else
        render action: :new
      end
    else
      render action: :confirm
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