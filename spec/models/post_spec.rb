require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests go here
  user_one = User.new(name: 'Tom', photo: 'link/goes/here', bio: 'Teacher from Mexico.')
  post = Post.new(title: 'Hello Rails', text: 'This is my first post', author_id: user_one.id)
  before { post.save }

  # title
  it 'title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'title should have a valid length' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  # comments counter
  it 'comments_counter should be numerical' do
    post.comments_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  # likes counter
  it 'title should be numerical' do
    post.likes_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'title should be greater than or equal to 0' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'recent posts count should be less than 6' do
    posts_count = post.recent_five.length
    expect(posts_count).to be < 6
  end
end
