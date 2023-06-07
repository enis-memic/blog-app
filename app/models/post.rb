class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.increment!(:post_counter)
  end
  after_save :update_posts_counter
end
