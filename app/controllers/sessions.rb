class Sessions < Application
  
  # GET /sessions/new
  def new
    render
  end
  
  # POST /sessions
  def create
    if User.authenticate(params[:username], params[:password])
      flash[:notice] = "You have logged in."
      session[:authenticated_user_id] = User[:username => params[:username]].id
      redirect url(:admin_posts)
    else
      flash[:warning] = "Login failed. Username/password combination did not match our records."
      redirect url(:new_session)
    end
  end
  
  # DELETE /sessions
  def delete
    flash[:notice] = "You have logged out."
    session[:authenticated_user_id] = nil
    redirect url(:posts)
  end
  
end
