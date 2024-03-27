class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :thumbs, dependent: :destroy
  has_many :liking_users, through: :thumbs, source: :user

  validates :body, presence: true, length: { minimum: 2 }

  def thumbed_by?(user)
    liking_users.include?(user)
  end
end
