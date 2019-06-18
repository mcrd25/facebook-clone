

FactoryBot.define do
  factory :notification do
    #factory :comment
    #factory :like
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