require 'rails_helper'

RSpec.describe Comment, type: :model do
  user_one = User.new(name: 'Tom', photo: 'link/goes/here', bio: 'Teacher from Mexico.')
  post = Post.new(title: 'Hello rails', text: 'This is my first post', author_id: user_one.id)
  comment = Comment.new(text: 'Hello beautiful people', author_id: user_one.id, post_id: post.id)

  it 'comment author_id to be equal to author id' do
    expect(comment.post_id).to be == post.id
  end
end
