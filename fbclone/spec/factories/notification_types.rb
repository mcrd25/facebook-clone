# == Schema Information
#
# Table name: notification_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :notification_type do
    name { "post_comment" }
  end
end
