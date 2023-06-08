require 'rails_helper'

describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Enis', photo: 'https://avatars.githubusercontent.com/u/118063058?v=4',
                       bio: 'Full-stack developer')
    @post = Post.new(author: @author, title: 'Post one', text: 'Post')

    @comment1 = Comment.create(author: @author, post: @post, text: 'Comment one')
    @comment2 = Comment.create(author: @author, post: @post, text: 'Comment two')
  end

  it 'will have the Posts comments_counter through update_comments_counter ' do
    expect(@post.comment_counter).to eq 2
  end
end
