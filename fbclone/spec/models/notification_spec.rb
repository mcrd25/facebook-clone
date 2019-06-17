# == Schema Information
#
# Table name: notifications
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  notification_type_id :integer
#  reference_id         :integer
#
# Indexes
#
#  index_notifications_on_notification_type_id  (notification_type_id)
#  index_notifications_on_reference_id          (reference_id)
#

require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:notification) { FactoryBot.build(:notification) }
  
  describe 'test for presence of model attributes for' do
    describe 'general expected attributes' do 
      it 'should include the :notification_type_id attribute' do 
        expect(notification.attributes).to include('notification_type_id')
      end

      it 'should include the :reference_id attribute' do 
        expect(notification.attributes).to include('reference_id')
      end
    end 

    describe 'Rails specific attributes' do
      it 'should include the :created_at attribute' do 
        expect(notification.attributes).to include('created_at')
      end

      it 'should include the :updated_at attribute' do 
        expect(notification.attributes).to include('updated_at')
      end

      it 'should include the :id attribute' do 
        expect(notification.attributes).to include('id')
      end
    end
  end

  describe 'Basic validations' do
    context 'notification_type_id' do 
      it 'is valid with a notification_type_id' do 
        notification.valid?
        expect(notification.errors[:notification_type_id]).to_not include("can't be blank")
      end

      it 'is invalid without a notification_type_id' do 
        notification.notification_type_id = nil
        notification.valid?
        expect(notification.errors[:notification_type_id]).to include("can't be blank")
      end
    end

    context 'reference_id' do 
      it 'is valid with a reference_id' do 
        notification.valid?
        expect(notification.errors[:reference_id]).to_not include("can't be blank")
      end

      it 'is invalid without a notification_type_id' do 
        notification.reference_id = nil
        notification.valid?
        expect(notification.errors[:reference_id]).to include("can't be blank")
      end
    end
  end
end
