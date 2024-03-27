class Post < ApplicationRecord
  validates :body, presence: true, length: { minimum: 4 }

  belongs_to :user

  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  def liked_by?(user)
    return false unless user

    liking_users.include?(user)
  end

  def like_by(user)
    likes.find_by(user:)
  end
end
