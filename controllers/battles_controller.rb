class BattlesController < ApplicationController
  def index
    @battles=Battle.where("p2_id != -1")
  end
  def entry
  end

  def edit
  end

  def choice
    @posts = @current_user.posts
  end

  def choicecheck
    @post = Post.find_by(id: params[:id])
  end

  def create
    battle=Battle.find_by(p2_id: '-1')
    if battle
      battle.p2_id=@current_user.id
      battle.p2_book = params[:book]
      battle.p2_body = params[:body]
      if battle.save
        redirect_to("/")
        flash[:notice]="マッチングしました！バトル開始！！"
      end
    else
      battle = Battle.new
      battle.p1_id = @current_user.id
      battle.p1_book = params[:book]
      battle.p1_body = params[:body]
      battle.p2_id= '-1'
      battle.p2_book = "*"
      battle.p2_body = "*"
      if battle.save
        redirect_to("/")
        flash[:notice]= "エントリー完了！マッチングし次第バトル開始します！"
      end
    end
  end

  def show
    @battle=Battle.find_by(id: params[:id])
    @player1=@battle.p1info
    @player2=@battle.p2info
    @updated_at=(@battle.updated_at).strftime("%Y-%m-%d %H:%M:%S")
    @now=(DateTime.current).strftime("%Y/%m/%d %H:%M:%S")
    @p1_points=@battle.p1_points
    @p2_points=@battle.p2_points
    if @p1_points > @p2_points
      @win_book=@battle.p1_book
      @win_player=@player1.name
    elsif @p1_points < @p2_points
      @win_book=@battle.p2_book
      @win_player=@player2.name
    else
      @win_player="同点でした！引き分け！"
    end
  end

  def p1body
    @battle=Battle.find_by(id: params[:id])
    @player1=@battle.p1info
    @book=@battle.p1_book
    @body=@battle.p1_body
  end

  def p2body
    @battle=Battle.find_by(id: params[:id])
    @player2=@battle.p2info
    @book=@battle.p2_book
    @body=@battle.p2_body
  end
end
