require 'rails_helper'

describe Like , type: :model do 
    before :each do
        @author = User.new(name: 'Enis', photo: 'https://avatars.githubusercontent.com/u/118063058?v=4', bio: 'Full-stack developer')
        @post = Post.new(author: @author, title: 'Post one', text: 'Post')
        @like = Like.create(author: @author, post: @post)
    end

    it 'Update likes counter' do 
        expect(@post.likes_counter).to eq 1
    end

end