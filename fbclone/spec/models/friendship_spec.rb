# == Schema Information
#
# Table name: friendships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  requestee_id :integer
#  requester_id :integer
#
# Indexes
#
#  index_friendships_on_requestee_id                   (requestee_id)
#  index_friendships_on_requester_id                   (requester_id)
#  index_friendships_on_requester_id_and_requestee_id  (requester_id,requestee_id) UNIQUE
#

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:friendship) { FactoryBot.build(:friendship) }

  describe 'test for presense of model attributes' do

    context 'general expected attributes' do
      it 'should include requester_id attribute' do
        expect(friendship.attributes).to include('requester_id')
      end

      it 'should include requestee_id attribute' do
        expect(friendship.attributes).to include('requestee_id')
      end
    end

    context 'Rails specific attributes' do
      it 'should include the :created_at attribute' do 
        expect(friendship.attributes).to include('created_at')
      end

      it 'should include the :updated_at attribute' do 
        expect(friendship.attributes).to include('updated_at')
      end

      it 'should include the :id attribute' do 
        expect(friendship.attributes).to include('id')
      end
    end
  end
end
