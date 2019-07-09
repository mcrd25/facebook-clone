# == Schema Information
#
# Table name: friendships
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  active_friend_id  :integer
#  passive_friend_id :integer
#
# Indexes
#
#  index_friendships_on_active_friend_id                        (active_friend_id)
#  index_friendships_on_active_friend_id_and_passive_friend_id  (active_friend_id,passive_friend_id) UNIQUE
#  index_friendships_on_passive_friend_id                       (passive_friend_id)
#

FactoryBot.define do
  factory :friendship do
    association :active_friend
    association :passive_friend

    factory :legal_friendship do 
      active_friend {  User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: 'test123',
        birth_date: Faker::Date.birthday,
        gender: Faker::Gender.binary_type
      ) }
      passive_friend {  User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: 'test123',
        birth_date: Faker::Date.birthday,
        gender: Faker::Gender.binary_type
      ) }
    end

    factory :ilegal_friendship do 
      active_friend { Friendship.first.passive_friend }
      passive_friend { Friendship.first.active_friend }      
    end

    # factory :fr_ilegal_active_friend do 

    #   active_friend_id { User.first.nil? ? 1 : User.count + 1}
    #   if User.first.nil?
    #     passive_friend { User.create!(
    #   first_name: Faker::Name.first_name,
    #   last_name: Faker::Name.last_name,
    #   email: Faker::Internet.email,
    #   password: 'test123',
    #   birth_date: Faker::Date.birthday,
    #   gender: Faker::Gender.binary_type
    #   ) }
    #   else
    #     passive_friend { User.first }
    #   end
    # end

    # factory :fr_ilegal_passive_friend do 
    #   passive_friend_id { User.first.nil? ? 1 : User.count + 1}
    #   if User.first.nil?
    #     active_friend { User.create!(
    #   first_name: Faker::Name.first_name,
    #   last_name: Faker::Name.last_name,
    #   email: Faker::Internet.email,
    #   password: 'test123',
    #   birth_date: Faker::Date.birthday,
    #   gender: Faker::Gender.binary_type
    #   ) }
    #   else
    #     active_friend { User.first }
    #   end
    # end
  end
end
