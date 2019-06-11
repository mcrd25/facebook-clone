require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  describe 'general expected attributes' do 
    it 'should include the :first_name attribute' do 
      expect(user.attributes).to include(:first_name)
    end

    it 'should include the :last_name attribute' do 
      expect(user.attributes).to include(:last_name)
    end

    it 'should include the :email attribute' do 
      expect(user.attributes).to include(:email)
    end

    it 'should include the :gender attribute' do 
      expect(user.attributes).to include(:gender)
    end

    it 'should include the :birthdate attribute' do 
      expect(user.attributes).to include(:birthdate)
    end

    it 'should include the :created_at attribute' do 
      expect(user.attributes).to include(:created_at)
    end

    it 'should include the :updated_at attribute' do 
      expect(user.attributes).to include(:updated_at)
    end

    it 'should include the :id attribute' do 
      expect(user.attributes).to include(:id)
    end
  end 

  describe 'Devise specific attributes' do 
    it 'should include the :encrypted_password attribute' do 
      expect(user.attributes).to include(:encrypted_password)
    end

    it 'should include the :reset_password_sent_at attribute' do 
      expect(user.attributes).to include(:reset_password_sent_at)
    end

    it 'should include the :reset_password_token attribute' do 
      expect(user.attributes).to include(:reset_password_token)
    end

    it 'should include the :remember_created_at attribute' do 
      expect(user.attributes).to include(:remember_created_at)
    end
  end
end
