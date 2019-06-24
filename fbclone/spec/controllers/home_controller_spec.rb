require 'rails_helper'

RSpec.describe HomeController, type: :controller do

	describe 'Index tests' do

		before do 
			@user = FactoryBot.create(:user)
		end

		context 'response' do
		  it 'expects response to index to be successful' do 
		    sign_in @user
		    get :index 
		    expect(response).to be_success
		  end
		end

		context 'http status' do
		  it 'returns a 200 response' do
		    sign_in @user
		    get :index
		    expect(response).to have_http_status '200'
		  end

		  it 'does not return 404 response' do
		  	sign_in @user
		  	get :index
		  	expect(response).to_not have_http_status '404'
		  end
		end

		context 'session' do
			it 'renders registration page when user is not signed in' do 
				get :index 
				expect(response).to render_template(:new)
			end 

			it 'renders new_controller#index when user is signed in' do
				sign_in @user 
				get :index
				expect(response).to render_template(:index)
			end 
		end
	end
end
