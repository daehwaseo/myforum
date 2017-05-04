class HomeController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
    @users = User.all
  end
end
