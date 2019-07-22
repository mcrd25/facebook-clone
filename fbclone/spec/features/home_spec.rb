require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  scenario "registered user signs in" do 
    user = FactoryBot.create(:user)

    visit root_path

    within '#login-form' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password 
    end

    click_button 'Log in' 

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content "#{user.first_name}"
  end  

  scenario "guest registers new user" do 
    user = FactoryBot.build(:user)

    visit root_path

    within 'main' do
      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      fill_in 'Email', with: user.email
      fill_in 'New Password', with: user.password 
      fill_in 'Birthday', with: user.birth_date 
      page.choose(name: 'user[gender]', option: user.gender)
    end

    expect {
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page).to have_content "#{user.first_name}"
    }.to change(User, :count).by(1)
  end
end
