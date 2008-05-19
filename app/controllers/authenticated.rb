# = Authenticated Controllers
# 
# Helper methods for securing website actions with authentication.
# 
class Authenticated < Application
  
  def current_user
    @current_user ||= User[session[:authenticated_user_id]] if session[:authenticated_user_id]
  end
  
  def authenticated?
    if current_user.nil?
      redirect url(:new_session)
    end
  end
  
end
