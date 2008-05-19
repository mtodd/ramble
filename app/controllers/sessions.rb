class Sessions < Application
  
  # GET /sessions/new
  def new
    render
  end
  
  # POST /sessions
  def create
    if User.authenticate(params[:username], params[:password])
      session[:authenticated_user_id] = User[:username => params[:username]].id
      redirect url(:admin_posts)
    else
      redirect url(:new_session)
    end
  end
  
  # DELETE /sessions
  def delete
    session[:authenticated_user_id] = nil
    redirect url(:posts)
  end
  
end
