class BlogController < ApplicationController
  def show_category
    @posts = Post.where(category: @category).order(display_order: :asc, id: :asc)
    render 'blog/index'
  end

  def home
    @category = 'home'
    show_category
  end

  def rules
    @category = 'rule'
    show_category
  end

  def faq
    @category = 'faq'
    show_category
  end
end
