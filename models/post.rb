class Post < ApplicationRecord
  validates :title,{presence: true}
  validates :bookname,{presence: true}
  validates :content,{presence: true}
  validates :janl,{presence: true}
  is_impressionable

  def comments
    return Comment.where(post_id: self.id)
  end

  def user
    return User.find_by(id: self.user_id)
  end

  def self.psearch(search)
    return Post.all unless search
    Post.where(['title LIKE ?',"%#{search}"])
  end

  def self.usearch(search)
    return User.all unless search
    User.where(['name LIKE ?',"%#{search}"])
  end

  def self.bsearch(search)
    return Battle.all unless search
    Battle.where(['p1_book LIKE ?',"%#{search}"]).where(['p2_book LIKE ?',"%#{search}"])
  end
end
