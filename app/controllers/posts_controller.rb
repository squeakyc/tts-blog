class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # If you didn't have this before_action defined here, you'd have to have the set_post method defined in show, edit, update & destroy - that's not DRY
  # Whenever you have identical code in a controller, put it inside a method and use a before_action.

  # GET /posts
  # GET /posts.json
  # This gets you an array-like structure of all the posts in the database and assigns them to posts. Then you can use posts in the view files.
  def index
    @posts = Post.all.page(params[:page])
  end

def user_posts
  @user = User.find_by(username: params[:name])
  @posts = @user.posts.page(params[:page])
end

  # GET /posts/1
  # GET /posts/1.json
  # this will define the show view
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # This sets up an instance variable that's used up top before any other method is run.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :author, :blog_entry, :user_id)
    end
end
