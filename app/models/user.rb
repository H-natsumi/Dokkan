class User < ApplicationRecord
  validates :user_id,{uniqueness: true}
  validates :user_id,{presence: true}
  validates :password,{presence: true}
  validates :email,{presence: true}
  validates :email,{uniqueness: true}
  validates :name,{presence: true}
  validates :age,{presence: true}

  def post
    return Post.where(user_id: self.id)
  end
end
