require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom', photo: '', bio: 'Teacher from Mexico.')
    @post_one = Post.create(title: 'Hello rails', text: 'This is my first post', author_id: @user.id)
    Post.create(title: 'Hello world', text: 'This is my second written in the rails framework', author_id: @user.id)
    Post.create(title: 'Lorem Psum1', text: 'Body of the text', author_id: @user.id)
    Post.create(title: 'Lorem Psum2', text: 'Body of the text', author_id: @user.id)
    Comment.create(text: 'Hello beautiful people', author_id: @user.id, post_id: @post_one.id)
    visit user_posts_path(@user)
  end

  it 'show username of a given user' do
    expect(page).to have_content('Tom')
  end

  it 'shows number of posts written by a given user' do
    expect(page).to have_content(1)
  end

  it 'shows post title of the user' do
    expect(page).to have_content('Hello rails')
  end

  it 'shows how many comments a post has' do
    expect(page).to have_content(1)
  end

  it 'shows how many likes a post has' do
    expect(page).to have_content(0)
  end

  it 'shows a section for pagination if there are more posts' do
    expect(page.html).to have_content('Pagination')
  end
end
