require 'rails_helper'

RSpec.describe HomeController, type: :controller do

	describe 'GET index' do

		let(:user) { FactoryBot.create(:user) }

		context 'when user is logged in' do 

			before do 
				sign_in user 
		    get :index 
			end

			it 'responds succesfully' do 
		    expect(response).to be_successful
		  end

		  it 'responds with 200' do
		    expect(response).to have_http_status '200'
		  end

		  it 'does not respond with 404' do
		  	expect(response).to_not have_http_status '404'
		  end

		  it 'renders index'do
				expect(response).to render_template(:index)
			end
		end

		context 'when user is not logged in' do
			it 'renders new' do 
				get :index 
				expect(response).to render_template(:new)
			end 
		end
	end
end
