# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#

FactoryBot.define do
  factory :like do
    #user_id { 1 }
    #post_id { 1 }

    association :post
    association :user
  end
end
