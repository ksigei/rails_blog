class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  after_create :update_posts_counter
  def update_posts_counter
    self.posts_counter = posts.count
    save
  end
end
