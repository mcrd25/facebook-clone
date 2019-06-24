require 'rails_helper'

RSpec.describe UserController, type: :controller do

  it describe '#index' do 
    get :index 
    expect(response).to be_sucess
  end

  it "returns a 200 response" do
    get :index
    expect(response).to have_http_status "200"
  end
end
