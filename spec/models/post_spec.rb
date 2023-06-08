require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My Post', comment_counter: 10, likes_counter: 10) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title length should be maximum 250' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'Comment counter should be integer' do
    subject.comment_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Comment counter should be 0 or greater' do
    subject.comment_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Likes counter should be integer' do
    subject.likes_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Likes counter should be 0 or greater' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end


  describe '#recent_comments' do
    let(:post) { Post.create(title: 'Test Post', author: author, text:'This is test post', comment_counter: 0, likes_counter: 0 ) }
    let(:author) { User.create(name: 'Elli', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from China.') }

    let!(:comment1) { Comment.create(author: author, post: post, text: 'Comment one') }
    let!(:comment2) { Comment.create(author: author, post: post, text: 'Comment two') }
    let!(:comment3) { Comment.create(author: author, post: post, text: 'Comment three') }
    let!(:comment4) { Comment.create(author: author, post: post, text: 'Comment four') }
    let!(:comment5) { Comment.create(author: author, post: post, text: 'Comment five') }
    let!(:comment6) { Comment.create(author: author, post: post, text: 'Comment six') }

    it 'returns the most recent 5 comments' do
      expect(post.recent_comments.size).to eq(5)
    end
  end

  describe '#update_posts_counter' do
  let(:user) { User.create(name: 'John Doe', photo: 'https://example.com/photo.jpg', post_counter: 0, bio: 'Lorem ipsum') }
  let(:post) { Post.new(title: 'Test Post', author: user, text: 'Is Microverse really the best tech school out there?',comment_counter: 0, likes_counter: 0) }

  it 'increments the author\'s post_counter' do
    post.save
    # It will calll update_posts_counter automatically after saving successfully
    expect(user.post_counter).to eq(1)
  end
end
end
