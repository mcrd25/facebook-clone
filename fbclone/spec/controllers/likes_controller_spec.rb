require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  # create
  let!(:user) { FactoryBot.create(:user) }
  let!(:other) { FactoryBot.create(:user) }
  let!(:liked_post) { FactoryBot.create(:post, user_id: user.id) }
  let!(:unliked_post) { FactoryBot.create(:post, user_id: other.id) }

  # build
  let(:thumbs_up) { FactoryBot.build(:like, post: liked_post, user: other) }
  let(:thumbs_down) { FactoryBot.build(:like, post: unliked_post, user: other) }


  describe 'POST create' do 

    context 'when user is logged in' do 

      before do 
        sign_in user 
      end

      context 'when authorised' do 

        it 'responds http status success' do 
          post :create, params: { username: user.username, post_id: liked_post.id } 
          expect(response).to have_http_status(:success)
        end

        it 'creates a post like' do 
          expect { post :create, params: { username: user.username, post_id: liked_post.id } }.to change(liked_post.likes, :count).by(1)
        end
      end
    end

    context 'when user is logged out' do 
      it 'does not create a post like' do 
        expect { post :create, params: { username: user.username, post_id: liked_post.id } }.to_not change(user.likes, :count)
      end
    end

  end

  describe 'DELETE destroy' do 
    

    context 'when user is logged in' do

      before do 
        
        thumbs_down.save
      end

      context 'when authorised' do 
        it 'destroys a post like' do 
          sign_in other
          expect { delete :destroy, params: { username: user.username, post_id: unliked_post.id, id: thumbs_down.id } }.to change(unliked_post.likes, :count).by(-1)
        end
      end

      context 'when not authorised' do 
        it 'does not destroy a like if not like owner' do 
          sign_in user
          expect { delete :destroy, params: { username: user.username, post_id: unliked_post.id, id: thumbs_down.id } }.to_not change(unliked_post.likes, :count)
        end
      end
    end

    context 'when user is logged out' do 
      
      before do 
        unliked_post.save
        thumbs_down.save
      end

      it 'does not destroy a like' do 
        expect { delete :destroy, params: { username: user.username, post_id: unliked_post.id, id: thumbs_down.id } }.to_not change(unliked_post.likes, :count)
      end
    end
  end
end
