class SessionsController < ApplicationController
  def new
  end

  def create
    if admin = AdminPasswordAuthenticator.verify(params[:login_name], params[:password])
      session[:current_admin_id] = admin.id
      redirect_to :root
    else
      flash.now.alert = "Login name or Password is incorrect"
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