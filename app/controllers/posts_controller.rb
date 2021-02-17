class PostsController < ApplicationController
  before_action :authenticate_user,{only:[:edit, :write, :write_form, :destroy]}
  impressionist :actions=> [:show]
  before_action :areyouthis,{only:[:destroycheck, :destroy]}
  
def index
  @posts=Post.all
  @novel=Post.where(janl: "novel")
  @social=Post.where(janl: "social")
  @hobby=Post.where(janl: "hobby")
  @business=Post.where(janl: "business")
  @art=Post.where(janl: "art")
  @child=Post.where(janl: "child")
end

def search
  @posts=Post.psearch(params[:search])
  @users=Post.usearch(params[:search])
  battles=Post.bsearch(params[:search])
  @battles=battles.where("p2_id != -1")
end

def write_form
end

def write
end


def create
  @post=Post.new
  @post.title= params[:title]
  @post.user_id= @current_user.id
  @post.janl= params[:janl]
  @post.bookname= params[:bookname]
  @post.content= params[:content]
  @post.explain= params[:explain]
  @post.save
  if @post.save
    redirect_to("/")
    flash[:notice] ="投稿しました"
  else
    flash[:notice] ="投稿失敗！未記入のところはないか確認しよう"
    render("posts/write")
  end


end

def show
  @post=Post.find_by(id: params[:id])
  @post.impressionist_count(:filter => :params)
end

def edit
  @post=Post.find_by(id: params[:id])
end

def update
    @post=Post.find_by(id: params[:id])
    @post.title= params[:title]
    @post.user_id= @current_user.id
    @post.janl= params[:janl]
    @post.bookname= params[:bookname]
    @post.content= params[:content]
    @post.explain= params[:explain]
    @post.save
    if @post.save
      redirect_to("/")
      flash[:notice] ="編集しました"
    else
      flash[:notice] ="編集失敗！未記入のところはないか確認しよう"
      render("posts/edit")
    end
end

def areyouthis
  if @current_user.id != Post.find_by(id: params[:id]).user_id.to_i
    redirect_to("/")
    flash[:notice]="権限がありません"
  end
end

def destroycheck
  @post=Post.find_by(id: params[:id])
end

def destroy
  post=Post.find_by(id: params[:id])
  post.destroy
  if post.destroy
    flash[:notice]="投稿を削除しました"
    redirect_to("/")
  end
end
end
