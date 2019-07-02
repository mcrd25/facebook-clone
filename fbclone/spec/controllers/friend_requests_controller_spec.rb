require 'rails_helper'

RSpec.describe FriendRequestsController, type: :controller do
  let(:a_user) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let(:request) { FactoryBot.create(:friend_request) }

  describe 'GET index' do
  end

  describe 'GET show' do
  end

  describe 'POST create' do

    context 'when logged in' do
      before do 
        sign_in a_user
      end 

      context 'when authorised' do
        it 'creates active request with valid attributes' do 
          expect { post :create, params: { username: other.username } }.to change(a_user.sent_requests, :count).by(1)
        end

        it 'does not create request with itself' do
          expect { post :create, params: { username: a_user.username } }.not_to change(a_user.sent_requests, :count)
        end
      end

      # context 'when unauthorised' do 
      #   it 'does not create request' do
      #     expect { post :create, params: { username: other.username } }.to change(a_user.sent_requests, :count).by(1)
      #   end

      #   it 'is unsuccesful' do 
      #     skip
      #   end
      # end
    end

    context 'when not logged in' do 
      it 'does not create request' do 
        expect { post :create, params: { username: other.username } }.not_to change(a_user.sent_requests, :count)
      end
    end
  end

  describe 'DELETE destroy' do

    context 'when logged in' do
      before do 
        sign_in a_user
      end 

      context 'when authorised' do
        skip
      end

      context 'when unauthorised' do 
        skip
      end

    end

    context 'when not logged in' do 
      skip
    end
  end
end
