require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  let(:a_user) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: a_user) }
  let(:other_post) { FactoryBot.create(:post, user: other) }


  describe 'GET index' do 

    context 'when user is logged in' do 

      before do 
        sign_in a_user
        get :index, params: { username: a_user.username }
      end

      it 'responds succesfully' do 
        expect(response).to be_successful
      end

      it 'responds with 200' do
        expect(response).to have_http_status '200'
      end

      it 'does not respond with 404' do
        expect(response).to_not have_http_status '404'
      end

      it 'renders :index template' do
        expect(response).to render_template(:index)
      end 
    end

    context 'when user is NOT logged in' do 

      before do 
        get :index, params: { username: a_user.username }
      end

      it 'responds succesfully' do 
        expect(response).to be_successful
      end

      it 'responds with 200' do
        expect(response).to have_http_status '200'
      end

      it 'does not respond with 404' do
        expect(response).to_not have_http_status '404'
      end

      it 'renders :index template' do
        expect(response).to render_template(:index)
      end 
    end
  end

  describe 'GET show' do 

    context 'when user is logged in' do 
      
      before do 
        sign_in a_user
        get :show, params: { username: a_user.username, id: post.id }
      end

      it 'responds succesfully' do 
        expect(response).to be_successful
      end

      it 'responds with 200' do
        expect(response).to have_http_status '200'
      end

      it 'does not respond with 404' do
        expect(response).to_not have_http_status '404'
      end

      it 'renders :show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'when user is NOT logged in' do 

      before do 
        get :show, params: { username: a_user.username, id: post.id }
      end

      it 'redirects to profile_posts_path' do 
        expect(response).to redirect_to(profile_posts_path)
      end
    end
  end

  describe 'GET edit' do 

    context 'when user is logged in' do 
      
      before do 
        sign_in a_user
      end

      context 'when editing his own post' do 
        before do 
          get :edit, params: { username: a_user.username, id: post.id }
        end

        it 'responds succesfully' do 
          expect(response).to be_successful
        end

        it 'responds with 200' do
          expect(response).to have_http_status '200'
        end

        it 'does not respond with 404' do
          expect(response).to_not have_http_status '404'
        end

        it 'renders :edit template' do
          expect(response).to render_template(:edit)
        end
      end

      context 'when editing another post' do 
        before do 
          get :edit, params: { username: other.username, id: other_post.id }
        end

        it 'does not respond succesfully' do 
          expect(response).to_not be_successful
        end

        it 'responds with 302' do
          expect(response).to have_http_status '302'
        end

        it 'does not respond with 200' do
          expect(response).to_not have_http_status '200'
        end

        it 'renders profile_post_path' do
          expect(response).to redirect_to(profile_post_path)
        end
      end
    end

    context 'when user is NOT logged in' do 

      before do 
        get :edit, params: { username: a_user.username, id: post.id }
      end

      it 'redirects to :index' do 
        expect(response).to redirect_to(profile_posts_path)
      end
    end
  end
end
