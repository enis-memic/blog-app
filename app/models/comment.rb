class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_comments_counter
    post.increment!(:comment_counter)
  end

  def decrement_comments_counter
    post.decrement!(:comment_counter)
  end

  after_save :update_comments_counter
end
