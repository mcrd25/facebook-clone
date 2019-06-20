# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  notifiable_type :string
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint
#
# Indexes
#
#  index_notifications_on_notifiable_type_and_notifiable_id  (notifiable_type,notifiable_id)
#

FactoryBot.define do
  factory :notification do
    status { "Unread" }
    
    trait :for_like do 
      association :notifiable, factory: :like
      status { "Unread" }
    end

    trait :for_comment do 
      association :notifiable, factory: :comment
      status { "Read" }
    end
  end
end
