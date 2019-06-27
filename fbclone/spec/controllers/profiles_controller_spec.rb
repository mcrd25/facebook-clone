require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  before do 
        @user = FactoryBot.create(:user)
      end

  describe 'GET show' do 
    

    context 'when logged user is logged in' do 

      it 'responds succesfully' do 
        sign_in @user
        get :show, params: { username: @user.username }
        expect(response).to be_successful
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

  describe 'GET edit' do 
    context 'when user is logged in' do
      it 'responds succesfully' do 
        sign_in @user 
        get :edit, params: { username: @user.username }
        expect(response).to be_successful
      end

      it 'responds succesfully' do 
        sign_in @user 
        get :edit, params: { username: @user.username }
        expect(response).to have_http_status '200'
      end
    end

    context 'when user is NOT logged in' do
      it 'responds succesfully' do 
        get :edit, params: { username: @user.username }
        expect(response).to redirect_to(:show)
      end
    end
  end
end
