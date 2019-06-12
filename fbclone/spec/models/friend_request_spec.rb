# == Schema Information
#
# Table name: friend_requests
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  requestee_id :integer
#  requester_id :integer
#
# Indexes
#
#  index_friend_requests_on_requestee_id                   (requestee_id)
#  index_friend_requests_on_requester_id                   (requester_id)
#  index_friend_requests_on_requester_id_and_requestee_id  (requester_id,requestee_id) UNIQUE
#

require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
	let(:friend_request) { FactoryBot.build(:friend_request) }

  describe 'test for presense of model attributes' do

    context 'general expected attributes' do
    	it 'should include requester_id attribute' do
    		expect(friend_request.attributes).to include('requester_id')
    	end

      it 'should include requestee_id attribute' do
        expect(friend_request.attributes).to include('requestee_id')
      end
    end

    context 'Rails specific attributes' do
      it 'should include the :created_at attribute' do 
        expect(friend_request.attributes).to include('created_at')
      end

      it 'should include the :updated_at attribute' do 
        expect(friend_request.attributes).to include('updated_at')
      end

      it 'should include the :id attribute' do 
        expect(friend_request.attributes).to include('id')
      end
    end
  end
end
