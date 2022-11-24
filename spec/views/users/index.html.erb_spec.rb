require 'rails_helper'

RSpec.describe 'Users index', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom', photo: 'link/goes/here', bio: 'Teacher from Mexico.')
    User.create(name: 'Lilly', photo: 'link/goes/here', bio: 'Teacher from Poland.')

    visit users_path
  end

  it 'show created users' do
    expect(page).to have_content('Tom')
    expect(page).to have_content('Lilly')
  end

  it 'renders photo of the user' do
    expect(page.html).to include(@user.photo)
  end

  it 'shows number of posts written by a given user' do
    expect(page).to have_content(1)
    expect(page).to have_content(0)
  end
end
