class Posts < Authenticated
  
  before :authenticated?, :exclude => [:index, :show]
  
  # GET /posts
  def index
    @posts = Post.order(:created_at.desc).all
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
      display @post
    end
  end
  
  # GET /posts/new
  def new
    @post = Post.new
    render
  end
  
  # POST /posts
  def create
    provides :xml, :json
    
    @post = Post.new(
      :title => params[:title],
      :intro => params[:intro],
      :body => params[:body],
      :author_id => current_user.id
    )
    
    if @post.save
      flash[:notice] = 'Post created.'
      return redirect(url(:admin_posts)) if content_type == :html
      render :xml => @post, :status => :created, :location => @post if content_type.in? :xml, :json
    else
      flash[:warning] = 'Post not created, there was an error.'
      return redirect(url(:admin_posts)) if content_type == :html
      render :xml => @post.errors, :status => :unprocessable_entity if content_type.in? :xml, :json
    end
  end
  
  # PUT /posts/1
  def update
    @post = Post[params[:id]]
    @post.update_with_params params
    
    if @post.save
      flash[:notice] = 'Post updated.'
      return redirect(url(:admin_posts)) if content_type == :html
      render :xml => @post, :status => :created, :location => @post if content_type.in? :xml, :json
    else
      flash[:warning] = 'Post not updated, there was an error.'
      return redirect(url(:admin_posts)) if content_type == :html
      render :xml => @post.errors, :status => :unprocessable_entity if content_type.in? :xml, :json
    end
  end
  
  # DELETE /posts/1
  def destroy
    @post = Post[params[:id]]
    
    if @post.destroy
      flash[:notice] = 'Post deleted.'
      return redirect(url(:admin_posts)) if content_type == :html
      render :xml => @post, :status => :created, :location => @post if content_type.in? :xml, :json
    else
      flash[:warning] = 'Post not deleted, there was an error.'
      return redirect(url(:admin_posts)) if content_type == :html
      render :xml => @post.errors, :status => :unprocessable_entity if content_type.in? :xml, :json
    end
  end
  
end
