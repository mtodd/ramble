class Posts < Application
  
  def index
    @posts = Post.order("created_at DESC").all
    render
  end
  
  # GET /posts/1
  # GET /posts/1.xml
  # GET /posts/1.json
  def show
    provides :xml, :json
    
    @post = Post[params[:id]]
    
    if content_type == :html
      render
    else
      display
    end
  end
  
  # POST /posts;create
  def create
    provides :xml, :json
    
    @post = Post.new(params[:post])
    
    if @post.save
      flash[:notice] = 'Post saved'
      redirect_to @post if content_type.in? :html
      render :xml => @psot, :status => :created, :location => @post if content_type.in? :xml, :json
    else
      render :action => 'new' if content_type.in? :html
      render :xml => @post.errors, :status => :unprocessable_entity if content_type.in? :xml, :json
    end
  end
  
end
