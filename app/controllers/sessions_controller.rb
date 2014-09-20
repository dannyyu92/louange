class SessionsController < ApplicationController
  
  skip_before_filter :require_login, except: [:destroy]

  def new
    if current_user
      redirect_to :root
    else
      render layout: "login"
    end
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:root, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end