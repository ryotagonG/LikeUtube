class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
