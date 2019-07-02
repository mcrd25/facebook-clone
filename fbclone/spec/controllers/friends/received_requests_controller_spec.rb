require 'rails_helper'

RSpec.describe Friends::ReceivedRequestsController, type: :controller do

	let(:a_user) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let(:request) { FactoryBot.create(:friend_request) }

	describe 'GET index' do
		context 'when logged in' do
      before do 
        sign_in a_user
      end 

      context 'when authorised' do
       
      end

      context 'when unauthorised' do 
      end
    end

    context 'when not logged in' do 
    end
  end

end
