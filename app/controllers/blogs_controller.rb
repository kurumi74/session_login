class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end
    def new
        @blog = Blog.new
    end
    def create
        @blog = current_user.blogs.build(blog_params)
        if @blog.save
          redirect_to blogs_path, notice: "ブログを作成しました！"
        else
          render :new
        end
      end
    def show
        Blog.find(params[:id])
    end
    def edit
        @blog = Blog.find(params[:id])
    end
    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
          redirect_to blogs_path, notice: "ブログを編集しました！"
        else
          render :edit
        end
    end
    def destroy
        @blog.destroy
        redirect_to blogs_path, notice:"ブログを削除しました！"
    end
    def confirm
        @blog = current_user.blogs.build(blog_params)
        render :new if @blog.invalid?
      end
    private
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
