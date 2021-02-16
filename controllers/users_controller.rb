class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:mypage]}
  def mypage
  end

  def login_form
  end

  def login
    @user = User.find_by(user_id: params[:user_id], password: params[:password])
    if @user
      session[:id] =@user.id
      flash[:notice]="ログインしました"
      redirect_to("/")
    else
      render("users/login_form")
    end
  end

  def edit
    @user=User.find_by(user_id: @current_user.user_id)
  end

  def update
    @user=User.find_by(user_id: @current_user.user_id)
    @user.name= params[:name]
    @user.user_id= params[:user_id]
    @user.password= params[:password]
    @user.email= params[:email]
    @user.age= params[:age]
    if @user.save
      redirect_to("/")
      flash[:notice] = "保存しました"
    else
      render("users/#{@user.user_id}/edit")
    end

  end

  def create
    @user= User.new(user_id: params[:user_id], password: params[:password], email:params[:email],name: params[:name],age: params[:age])
    @user.save
    if @user.save
      redirect_to("/")
      flash[:notice]="登録しました"
      session[:user_id] = @user.user_id
    else
      flash[:notice]="登録できませんでした"
      render("users/new")
    end
  end

  def new
  end

  def show
    @user=User.find_by(id: params[:id])
  end

  def logout
    session[:user_id] = nil
    flash[:notice]="ログアウトしました"
    redirect_to("/users/login")
  end

  def likes
  end

  def garally
  end

  def concern
  end
end
