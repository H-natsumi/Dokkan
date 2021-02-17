class Battle < ApplicationRecord

  def posts
    return Post.where(id: @current_user.id)
  end

  def p1info
    return User.find_by(id: self.p1_id)
  end

  def p2info
    return User.find_by(id: self.p2_id)
  end

  def p1_points
    points = Point.where(battle_id: self.id)
    p1_point = points.where(winner_id: self.p1_id)
    return p1_point.count
  end

  def p2_points
    points = Point.where(battle_id: self.id)
    p2_point = points.where(winner_id: self.p2_id)
    return p2_point.count
  end

end
