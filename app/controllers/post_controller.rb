class PostController < ApplicationController
    def index
    end
    
    def read_post
       @post = Post.find(params[:post_id])
        if user_signed_in?
            @new_comment = Comment.build_from(@post, current_user.id, "")
        end
       @comments = Comment.all
       @users = User.all
    end
    
    def create
        post = Post.new
        post.title = params[:board_title]
        post.content = params[:board_content]
        post.edit_user_name = params[:user_name]
        post.edit_user_email = params[:user_email]
        post.save
        
        redirect_to '/'
    end
    
    def edit
       @post = Post.find(params[:post_id]) 
    end
    
    def update
       post = Post.find(params[:post_id])
       post_id = params[:post_id]
       post.title = params[:board_title]
       post.content = params[:board_content]
       post.save
       
       redirect_to :controller => 'post', :action => 'read_post', :id => post_id
    end
    
    def destroy
        post = Post.find(params[:post_id])
        post.destroy
        
        redirect_to '/'
    end
end
