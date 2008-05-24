class Pages < Authenticated
  
  before :authenticated?, :exclude => [:index, :show]
  
  # GET /pages
  def index
    @pages = Page.all
    render
  end
  
  # GET /pages/1
  # GET /pages/1.xml
  # GET /pages/1.json
  def show
    provides :xml, :json
    
    @page = Page[:id => params[:id]] || Page[:slug => params[:id]]
    
    if content_type == :html
      render
    else
      display @page
    end
  end
  
  # GET /pages/new
  def new
    @page = Page.new
    render
  end
  
  # POST /pages
  def create
    provides :xml, :json
    
    @page = Page.new(
      :title => params[:title],
      :slug => params[:slug],
      :content => params[:content]
      # :author_id => current_user.id
    )
    
    if @page.save
      flash[:notice] = 'Page created.'
      return redirect(url(:admin_pages)) if content_type == :html
      render :xml => @page, :status => :created, :location => @page if content_type.in? :xml, :json
    else
      flash[:warning] = 'Page not created, there was an error.'
      return redirect(url(:admin_pages)) if content_type == :html
      render :xml => @page.errors, :status => :unprocessable_entity if content_type.in? :xml, :json
    end
  end
  
  # PUT /pages/1
  def update
    @page = Page[:id => params[:id]] || Page[:slug => params[:id]]
    @page.update_with_params params
    
    if @page.save
      flash[:notice] = 'Page updated.'
      return redirect(url(:admin_pages)) if content_type == :html
      render :xml => @page, :status => :created, :location => @page if content_type.in? :xml, :json
    else
      flash[:warning] = 'Page not updated, there was an error.'
      return redirect(url(:admin_pages)) if content_type == :html
      render :xml => @page.errors, :status => :unprocessable_entity if content_type.in? :xml, :json
    end
  end
  
  # DELETE /pages/1
  def destroy
    @page = Page[:id => params[:id]] || Page[:slug => params[:id]]
    
    if @page.destroy
      flash[:notice] = 'Page deleted.'
      return redirect(url(:admin_pages)) if content_type == :html
      render :xml => @page, :status => :created, :location => @page if content_type.in? :xml, :json
    else
      flash[:warning] = 'Page not deleted, there was an error.'
      return redirect(url(:admin_pages)) if content_type == :html
      render :xml => @page.errors, :status => :unprocessable_entity if content_type.in? :xml, :json
    end
  end
  
end
