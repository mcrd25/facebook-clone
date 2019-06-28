require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'GET index' do 

    let(:user) { FactoryBot.create(:user) }

    context 'when user is logged in' do 

      before do 
        sign_in user
      end

      it 'responds succesfully' do 
        get :index, params: { username: user.username }
        expect(response).to be_successful
      end

      it 'responds with 200' do
        get :index, params: { username: user.username }
        expect(response).to have_http_status '200'
      end

      it 'does not respond with 404' do
        get :index, params: { username: user.username }
        expect(response).to_not have_http_status '404'
      end

      it 'renders :show template' do
        get :index, params: { username: user.username }
        expect(response).to render_template(:index)
      end 
    end
  end
end
