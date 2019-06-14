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
  let(:friendship) { FactoryBot.create(:friendship) }

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

  describe 'Basic validations' do
    context 'requester_id' do
      it 'is valid with a requester_id' do 
        friendship.valid?
        expect(friendship.errors[:requester_id]).to_not include("can't be blank")
      end

      it 'is invalid without a user_id' do 
        friendship.requester_id = nil
        friendship.valid?
        expect(friendship.errors[:requester_id]).to include("can't be blank")
      end
    end

    context 'requestee_id' do
      it 'is valid with a requestee_id' do 
        friendship.valid?
        expect(friendship.errors[:requestee_id]).to_not include("can't be blank")
      end

      it 'is invalid without a user_id' do 
        friendship.requestee_id = nil
        friendship.valid?
        expect(friendship.errors[:requestee_id]).to include("can't be blank")
      end
    end
   end

   describe 'Associations' do
    context 'user' do 
      it 'should belong to requestee' do 
        should belong_to(:requestee) 
      end 
      it 'should belong to requester' do 
        should belong_to(:requester) 
      end 
    end
  end
end
