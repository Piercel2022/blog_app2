require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # index
  describe 'GET #index' do
    before(:example) do
      get '/users'
    end

    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  # show
  describe 'GET show' do
    before(:example) do
      get '/users/1'
    end

    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template' do
      expect(response).to render_template('show')
    end
  end
end
