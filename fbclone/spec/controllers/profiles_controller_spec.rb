require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  describe 'GET show' do 

    context 'when logged user is logged in' do 

      before do 
        @user = FactoryBot.create(:user)
      end

      it 'responds succesfully' do 
        sign_in @user
        get :show, params: { username: @user.username }
        expect(response).to be_success
      end

      it 'responds with 200' do
        sign_in @user
        get :show, params: { username: @user.username }
        expect(response).to have_http_status '200'
      end

      it 'does not respond with 404' do
        sign_in @user
        get :show, params: { username: @user.username }
        expect(response).to_not have_http_status '404'
      end

      it 'renders index' do
        sign_in @user 
        get :show, params: { username: @user.username }
        expect(response).to render_template(:show)
      end 
    end
  end
end
