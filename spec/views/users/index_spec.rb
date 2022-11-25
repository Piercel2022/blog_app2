require 'rails_helper'

RSpec.describe 'Users index', type: :feature do
  before(:example) do
    @user = User.create(name: 'Elon Musk', photo: 'link/goes/here', bio: 'this is my bio')
    User.create(name: 'Diamond Platnumz', photo: 'link/goes/here', bio: 'this is my bio')

    visit users_path
  end

  it 'show created users' do
    expect(page).to have_content('Elon Musk')
    expect(page).to have_content('Diamond Platnumz')
  end

  it 'renders photo of the user' do
    expect(page.html).to include(@user.photo)
  end

  it 'shows number of posts written by agiven user' do
    expect(page).to have_content(0)
  end

  it 'redirects to a give user show page' do
    click_link @user.name
    expect(page).to have_current_path(user_path(@user.id))
  end
end
