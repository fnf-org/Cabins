class PostsController < ApplicationController
  before_action :require_admin

  def show_posts
    @posts = Post.where(category: @category).order(display_order: :asc, id: :asc)
    @path = Rails.application.routes.url_helpers.send("new_#{@category}_path")
    render 'posts/index'
  end

  def show_home
    @category = 'home'
    show_posts
  end

  def show_rule
    @category = 'rule'
    show_posts
  end

  def show_faq
    @category = 'faq'
    show_posts
  end

  def new
    @post = Post.new
    @post.category = @category
    @error = @post # tell _error_messages.html.erb to use this object for form errors
    render 'posts/new'
  end

  def new_home
    @category = 'home'
    new
  end

  def new_rule
    @category = 'rule'
    new
  end

  def new_faq
    @category = 'faq'
    new
  end

  def create
    @post = Post.new(post_params)
    @category = @post.category
    @error = @post # tell _error_messages.html.erb to use this object for form errors

    if @post.save
      logger.info("user #{current_user.id} created post #{@post.id} in category #{@category}")
      flash.now[:success] = "#{@category} post created!"
      show_posts
    else
      new
    end
  end

  def show
    @post = Post.find(params[:id])
    @error = @post
  end

  def update
    @post = Post.find(params[:id])
    @category = @post.category
    @error = @post # tell _error_messages.html.erb to use this object for form errors

    if @post.update(post_params)
      logger.info("user #{current_user.id} updated post #{@post.id} in category #{@category}")
      flash.now[:success] = 'post updated'
      show_posts
    else
      render 'show'
    end
  end

  # up is down & down is up
  def display_up
    display_delta(-1)
  end

  # up is down & down is up
  def display_down
    display_delta(1)
  end

  def display_delta(inc)
    @post = Post.find(params[:id])
    @category = @post.category
    @display_order = @post.display_order
    @error = @post # tell _error_messages.html.erb to use this object for form errors

    if @post.display_order
      @post.display_order += inc
    else
      @post.display_order = 50
    end

    @post.save
    if @post.save
      # flash.now[:success] = "display order updated"
    else
      flash.now[:danger] = @post.errors.full_messages
    end
    show_posts
  end

  def delete
    @post = Post.find(params[:id])
    @category = @post.category
    @post.destroy
    logger.info("user #{current_user.id} deleted post #{@post.id} in category #{@category}")
    flash.now[:success] = "post deleted"
    show_posts
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :category, :display_order)
    end

end
