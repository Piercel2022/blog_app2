require 'rails_helper'

RSpec.describe 'User post', type: :feature do
  before(:example) do
    @user = User.create(name: 'Elon Musk', photo: 'link/goes/here', bio: 'this is my bio')
    @post_one = Post.create(title: 'My first post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My second post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My third post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My fourth post', text: 'Body text of the post', author_id: @user.id)

    visit user_posts_path(@user, @post_one.id)
  end

  it 'renders posts title ' do
    expect(page.html).to include(@post_one.title)
  end
end