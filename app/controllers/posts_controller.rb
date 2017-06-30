class PostsController < ApplicationController
    def new
    end
    
    def create
        #입력받은 제이터를 실제 DB에 저장할 액션
        @post = Post.new
        @post.title = params[:title]
        @post.content = params[:content]
        @post.save
        redirect_to "/posts/show/#{@post.id}"
    end
    
    # Read
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:post_id])
        @comments = Comment.where(post_id: params[:post_id])
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @post.destroy
        redirect_to '/'
    end
    
    def edit
        @post = Post.find(params[:post_id])
    end
    
    def update
        @post = Post.find(params[:post_id])
        @post.title = params[:title]
        @post.content = params[:content]
        @post.save
        redirect_to "/posts/show/#{@post.id}"
    end
end
