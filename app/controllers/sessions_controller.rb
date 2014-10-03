class SessionsController < ApplicationController
  def new
    if params[:from].present?
      session[:from] = "from"
    end
  end

  def create
    if user = UserPasswordAuthenticator.verify(params[:login_name], params[:password])
      user.update_column(:logged_at, Time.current)
      session[:current_user_id] = user.id
      if params[:from].present?
        redirect_to params[:from]
      else
        redirect_to :root
      end
    else
      flash.now.alert = "ログイン名またはパスワードが間違っています。"
      render action: :new
    end
  end

  def callback
    if request.env['omniauth.auth']
      user_identity = OmniAuthAuthenticator.verify(env['omniauth.auth'])
      if user_identity.new_record?
        session[:omniauth_provider] = user_identity.provider
        session[:omniauth_uid] = user_identity.uid
        session[:omniauth_info] = user_identity.info
        @user = user_identity
        render :callback
      else
        session[:current_user_id] = user_identity.user.id
        render :callback
      end
    else
      render "failure"
    end
  end

  # GET (for OmniAuth)
  def failure
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to :root
  end
end