# == Schema Information
#
# Table name: friend_requests
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  requestee_id :integer
#  requester_id :integer
#
# Indexes
#
#  index_friend_requests_on_requestee_id                   (requestee_id)
#  index_friend_requests_on_requester_id                   (requester_id)
#  index_friend_requests_on_requester_id_and_requestee_id  (requester_id,requestee_id) UNIQUE
#

FactoryBot.define do
  factory :friend_request do
    association :requester
    association :requestee

    factory :ilegal_friend_request do 
      requester { FriendRequest.first.requestee }
      requestee { FriendRequest.first.requester }      
    end

    factory :fr_ilegal_requester do 

      requester_id { User.first.nil? ? 1 : User.count + 1}
      if User.first.nil?
        requester { User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'test123',
      birth_date: Faker::Date.birthday,
      gender: Faker::Gender.binary_type
      ) }
      else
        requestee { User.first }
      end
    end

    factory :fr_ilegal_requestee do 
      requester_id { User.first.nil? ? 1 : User.count + 1}
      if User.first.nil?
        requester { User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'test123',
      birth_date: Faker::Date.birthday,
      gender: Faker::Gender.binary_type
      ) }
      else
        requester { User.first }
      end
    end
  end
end
