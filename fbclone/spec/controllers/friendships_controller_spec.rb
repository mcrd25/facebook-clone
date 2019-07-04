require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  describe 'POST create' do

    context 'when logged in' do 

      before do 
        sign_in a_user
      end

      context 'when authorised' do 
        skip
      end

      context 'when not authorised' do 
        skip
      end
    end

    context 'when not logged in' do 
    end
  end

  describe 'DELETE destroy' do

    context 'when logged in' do 

      before do 
        sign_in a_user
      end

      context 'when authorised' do 
        skip
      end

      context 'when not authorised' do 
        skip
      end
    end

    context 'when not logged in' do 
      skip
    end
  end

end
