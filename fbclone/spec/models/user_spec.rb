# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birth_date             :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  describe 'test for presence of model attributes for' do

    describe 'general expected attributes' do 
      it 'should include the :first_name attribute' do 
        expect(user.attributes).to include('first_name')
      end

      it 'should include the :last_name attribute' do 
        expect(user.attributes).to include('last_name')
      end

      it 'should include the :email attribute' do 
        expect(user.attributes).to include('email')
      end

      it 'should include the :gender attribute' do 
        expect(user.attributes).to include('gender')
      end

      it 'should include the :birthdate attribute' do 
        expect(user.attributes).to include('birth_date')
      end
    end 

    describe 'Devise specific attributes' do 
      it 'should include the :encrypted_password attribute' do 
        expect(user.attributes).to include('encrypted_password')
      end

      it 'should include the :reset_password_sent_at attribute' do 
        expect(user.attributes).to include('reset_password_sent_at')
      end

      it 'should include the :reset_password_token attribute' do 
        expect(user.attributes).to include('reset_password_token')
      end

      it 'should include the :remember_created_at attribute' do 
        expect(user.attributes).to include('remember_created_at')
      end
    end

    describe 'Rails specific attributes' do
      it 'should include the :created_at attribute' do 
        expect(user.attributes).to include('created_at')
      end

      it 'should include the :updated_at attribute' do 
        expect(user.attributes).to include('updated_at')
      end

      it 'should include the :id attribute' do 
        expect(user.attributes).to include('id')
      end
    end
  end

  describe 'Basic validations' do

  end

end
