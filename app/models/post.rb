class Post < ApplicationRecord
    include Visible

    has many :comments, :likes
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true

    def update_posts_counter
        user = self.user
        user.posts_counter = user.posts.count
        user.save
    end

    def recent_comments
        comments.order(created_at: :desc).limit(5)
    end
  
end
