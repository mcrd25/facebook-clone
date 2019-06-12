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
	let(:FriendRequest) { requester_id: 1, requestee_id: 2 }
  describe 'test for presense of model attributes' do
  	it 'should include requester_id attribute' do
  		expect(user.attributes).to include('first_name')
  	end
  end
end
