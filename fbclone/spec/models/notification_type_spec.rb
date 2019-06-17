# == Schema Information
#
# Table name: notification_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe NotificationType, type: :model do
  let(:notification_type) { FactoryBot.build(:notification_type) }
  
  describe 'test for presence of model attributes for' do
    describe 'general expected attributes' do 
      it 'should include the :name attribute' do 
        expect(notification_type.attributes).to include('name')
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
    context 'name' do 
      it 'is valid with a name' do 
        notification_type.valid?
        expect(notification_type.errors[:name]).to_not include("can't be blank")
      end
      it 'is valid when name is post_comment or post_like' do
      	notification_type.name = 'post_comment'
        notification_type.valid?
        expect(notification_type.errors[:name]).to_not include("#{notification_type.name} is not a valid name")
        notification_type.name = 'post_like'
        notification_type.valid?
        expect(notification_type.errors[:name]).to_not include("#{notification_type.name} is not a valid name")
      end

      it 'is invalid if name is not post_comment or post_like' do
        notification_type.name = 'Maggot'
        notification_type.valid?
        expect(notification_type.errors[:name]).to include("#{notification_type.name} is not a valid name")
      end

      it 'is invalid without a notification_type_id' do 
        notification_type.name = nil
        notification_type.valid?
        expect(notification_type.errors[:name]).to include("can't be blank")
      end

      

      
    end

    
  end
end
