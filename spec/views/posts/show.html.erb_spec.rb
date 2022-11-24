require 'rails_helper'

RSpec.describe 'User post', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom', photo: 'link/goes/here', bio: 'This is my bio')
    @post_one = Post.create(title: 'Hello rails', text: 'My first post', author_id: @user.id)
    Post.create(title: 'Hello world', text: 'This is my second written in the rails framework', author_id: @user.id)
    Post.create(title: 'Lorem Psum1',
                text: 'Body of the text', author_id: @user.id)
    Post.create(title: 'Lorem Ipsum2 ',
                text: 'Body of the text', author_id: @user.id)
    Comment.create(text: 'Hello beautiful people', author_id: @user.id, post_id: @post_one.id)

    visit user_post_path(@user, @post_one.id)
  end
  it 'renders who wrote the post ' do
    expect(page.html).to include(@user.name)
  end
  it 'renders number of comments ' do
    expect(page).to have_content(1)
  end
  it 'renders number of likes ' do
    expect(page).to have_content(0)
  end
  it 'renders post body ' do
    expect(page).to have_content(@post_one.text)
  end
  it 'renders username of each commentor ' do
    expect(page.html).to include(@user.name)
  end
  it 'renders comment of each commentor ' do
    expect(page).to have_content('Hello beautiful people')
  end
end
