class Application < Merb::Controller
  
  # Run Flash handlers
  before :set_flashes_from_session
  after :set_session_from_flashes
  
  def flash
    @flash ||= {}
  end
  
  private
  
  # Set the flash for display in the views from the session.
  # 
  def set_flashes_from_session
    @flash_for_display = {}
    
    @flash_for_display[:notice] = session[:_flash_notice] if session[:_flash_notice]
    session[:_flash_notice] = nil
    
    @flash_for_display[:warning] = session[:_flash_warning] if session[:_flash_warning]
    session[:_flash_warning] = nil
  end
  
  # Save flash values to the session for dipslay in views next request.
  # 
  def set_session_from_flashes
    @flash_for_display[:notice] = session[:_flash_notice] = flash[:notice] if flash[:notice]
    @flash_for_display[:warning] = session[:_flash_warning] = flash[:warning] if flash[:warning]
  end
  
end
