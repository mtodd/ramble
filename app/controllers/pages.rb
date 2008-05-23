class Pages < Application
  
  def index
    @pages = Page.all
    render
  end
  
  def show
    @page = Page[:id => params[:id]] || Page[:slug => params[:id]]
    render
  end
  
end
