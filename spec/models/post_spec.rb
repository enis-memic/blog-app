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
end
