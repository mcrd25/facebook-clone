require 'rails_helper'

RSpec.feature "Notifications", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:friend) { FactoryBot.create(:user) }
  let(:friendship) { FactoryBot.create(:friendship, active_friend: user, passive_friend: friend) }
  let(:post) { FactoryBot.create(:post, user: user) }
  let(:comment) { FactoryBot.create(:comment, user: friend, post: post) }
  let(:comment_notif) { FactoryBot.create(:notification, notifiable: comment, user: user) }

  scenario "user sees new notification" do 
    sign_in user
    visit("/notifications")

    p "#{friendship.active_friend.full_name}"
    p "#{friendship.passive_friend.full_name}"
    p "#{comment.post.user.full_name}"
    p "#{comment.user.full_name}"

    p "#{comment_notif.inspect}"
    expect(page).to have_content("#{comment.user.full_name}")
  end
end
