# == Schema Information
#
# Table name: notification_types
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe NotificationType, type: :model do
  let(:notification_type) { FactoryBot.build(:notification_type) }
  
  describe 'test for presence of model attributes for' do
    describe 'general expected attributes' do 
      it 'should include the :type attribute' do 
        expect(notification_type.attributes).to include('type')
      end
    end 

    describe 'Rails specific attributes' do
      it 'should include the :created_at attribute' do 
        expect(notification_type.attributes).to include('created_at')
      end

      it 'should include the :updated_at attribute' do 
        expect(notification_type.attributes).to include('updated_at')
      end

      it 'should include the :id attribute' do 
        expect(notification_type.attributes).to include('id')
      end
    end
  end

  describe 'Basic validations' do
    context 'type' do 
      it 'is valid with a type' do 
        notification_type.valid?
        expect(notification_type.errors[:type]).to_not include("can't be blank")
      end
      it 'is valid when type is post_comment or post_like' do
      	notification_type.type = 'post_comment'
        notification_type.valid?
        expect(notification_type.errors[:type]).to_not include("#{notification_type.type} is not a valid type")
        notification_type.type = 'post_like'
        notification_type.valid?
        expect(notification_type.errors[:type]).to_not include("#{notification_type.type} is not a valid type")
      end

      it 'is invalid if type is not post_comment or post_like' do
        notification_type.type = 'Maggot'
        notification_type.valid?
        expect(notification_type.errors[:type]).to include("#{notification_type.type} is not a valid type")
      end

      it 'is invalid without a notification_type_id' do 
        notification_type.type = nil
        notification_type.valid?
        expect(notification_type.errors[:type]).to include("can't be blank")
      end

      

      
    end

    
  end
end
