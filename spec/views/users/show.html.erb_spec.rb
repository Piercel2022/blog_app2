require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom', photo: 'link/goes/here', bio: 'Teacher from Mexico.')
    Post.create(title: 'My first post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My second post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My third post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My fourth post', text: 'Body text of the post', author_id: @user.id)

    visit user_path(@user)
  end

  it 'renders photo of the user' do
    expect(page.html).to include(@user.photo)
  end

  it 'show username of a given user' do
    expect(page).to have_content('Tom')
  end

  it 'shows number of posts written by agiven user' do
    expect(page).to have_content(4)
  end

  it 'shows bio of the user' do
    expect(page).to have_content('Teacher from Mexico.')
  end

  it 'the first three posts of the user' do
    expect(page).to have_content('My fourth post')
    expect(page).to have_content('My second post')
    expect(page).to have_content('My third post')
  end

  it 'shows the see all posts button' do
    expect(page.html).to have_content('See all posts')
  end

  it 'redirects to a given user show page' do
    click_link @user.name
    expect(page).to have_current_path(user_path(@user.id))
  end

  it "redirects to a user's posts index" do
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user.id))
  end
end
