# == Schema Information
#
# Table name: notifications
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  notification_type_id :integer
#  reference_id         :integer
#
# Indexes
#
#  index_notifications_on_notification_type_id  (notification_type_id)
#  index_notifications_on_reference_id          (reference_id)
#

FactoryBot.define do
	# factory :like
	# factory :comment

  factory :notification do
  	for_like
  	
    trait :for_like do 
      association :reference, factory: :like
    end
    
    trait :for_comment do 
      association :reference, factory: :comment
    end

    association :notification_type 
  end
end
