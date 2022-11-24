require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'Tom', photo: 'link/goes/here', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be valid' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
