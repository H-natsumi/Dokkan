class PointsController < ApplicationController
  def create
    @battle=Battle.find_by(id: params[:id])
    updated_at=(@battle.updated_at).strftime("%Y-%m-%d %H:%M:%S")
    now=(DateTime.current).strftime("%Y/%m/%d %H:%M:%S")
    point=Point.new
    point.user_id=@current_user.id
    point.battle_id=params[:id]
    point.winner_id=params[:winner_id]
    if  ((now.to_time - updated_at.to_time) / 60 /60 /24).to_i < 3
      point.save
      redirect_to("/battles/#{@battle.id}")
      flash[:notice]="投票しました！"
    else
      redirect_to("/battles/#{@battle.id}")
      flash[:notice]="もう投票できません。"
    end
  end
end
