require 'rails_helper'

RSpec.describe Post, type: :model do
    subject {User.new(name: 'Enis', photo: 'https://avatars.githubusercontent.com/u/118063058?v=4', post_counter:10, bio: 'Full-stack developer')}

    before {subject.save}

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