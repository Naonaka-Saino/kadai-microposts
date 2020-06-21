class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  #いいね機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user, dependent: :destroy#?
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
