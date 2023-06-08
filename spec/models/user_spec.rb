require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Enis', photo: 'https://avatars.githubusercontent.com/u/118063058?v=4', post_counter: 10, bio: 'Full-stack developer') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter must be integer' do
    subject.post_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Post counter should be 0 or greater' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end
end

describe 'Tests:' do
  context 'Methods of User:' do
    it '#recent_posts method should return zero(0) when new user is created' do
      new_user = User.new(name: 'Elli', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from China.')
                            puts new_user.recent_posts
      expect(new_user.recent_posts.count).to eq 0
    end

    it '#recent_posts method should return the last three(3) posts of the user' do
    new_user = User.new(name: 'Elli', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from China.')
    new_user.save
    post1 = Post.create(title: 'Test Post', author: new_user, text:'This is test post', comment_counter: 0, likes_counter: 0 )
    post2 = Post.create(author: new_user, title: 'Codding', text: 'Software development is a crucial aspect of the tech industry', comment_counter: 0, likes_counter: 0)
    post3 = Post.create(author: new_user, title: 'Nigeria', text: 'Nigeria is a beautiful country to visit', comment_counter: 0, likes_counter: 0)
    post4 = Post.create(author: new_user, title: 'Microverse', text: 'Is Microverse really the best tech school out there?', comment_counter: 0, likes_counter: 0)
    
  recent_posts = new_user.recent_posts
  
  expect(recent_posts.size).to eq(3)
  end


  end
  end
