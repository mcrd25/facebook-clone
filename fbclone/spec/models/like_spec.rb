# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Like, type: :model do
  
  let(:like) { FactoryBot.create(:like) }

=begin
  let(:ilegal_user) { User.count.nil? ? 1 : User.count + 1 }
  let(:ilegal_post) { Post.count.nil? ? 1 : Post.count + 1 }

  let(:like_with_ilegal_user) { Like.new(post_id: Post.first.id, user_id: ilegal_user, message: "Hello World") }
  let(:like_with_ilegal_post) { Like.new(post_id: ilegal_post, user_id: User.first.id, message: "Hello World") }
=end
  
  describe 'test for presence of model attributes' do
    context 'general expected attributes' do
      it 'should include user_id attribute' do
        expect(like.attributes).to include('user_id')
      end

      it 'should include message attribute' do
        expect(like.attributes).to include('post_id')
      end
    end

    context 'Rails specific attributes' do
      it 'should include the :created_at attribute' do 
        expect(like.attributes).to include('created_at')
      end

      it 'should include the :updated_at attribute' do 
        expect(like.attributes).to include('updated_at')
      end

      it 'should include the :id attribute' do 
        expect(like.attributes).to include('id')
      end
    end
  end

  describe 'Basic validations' do
    context 'user_id' do 
      it 'is valid with a user_id' do 
        like.valid?
        expect(like.errors[:user_id]).to_not include("can't be blank")
      end

      it 'is invalid without a user_id' do 
        like.user_id = nil
        like.valid?
        expect(like.errors[:user_id]).to include("can't be blank")
      end
    end

    context 'post_id' do
      it 'is valid with a post_id' do 
        like.valid?
        expect(like.errors[:post_id]).to_not include("can't be blank")
      end

      it 'is invalid without a post_id' do 
        like.post_id = nil
        like.valid?
        expect(like.errors[:post_id]).to include("can't be blank")
      end
    end

  end


  describe "Associations" do

    context 'post' do 
      it 'hast correct belongs_to association' do 
        should belong_to(:post) 
      end 
    end

    context 'user' do 
      it 'has correct belongs_to association' do 
        should belong_to(:user) 
      end
    end
  end

=begin
  describe 'Constraints' do 
    context 'when like is created with user that does not exist' do 
      it 'should raise user must exist error' do 
        expect { like_with_ilegal_user.save! }.to  raise_error(ActiveRecord::RecordInvalid, 'Validation failed: User must exist')
      end 
    end 

    context 'when like is created with post that does not exist' do 
      it 'should raise post must exist error' do 
        expect { like_with_ilegal_post.save! }.to  raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Post must exist')
      end 
    end 
  end
=end
end
