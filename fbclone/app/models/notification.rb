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

class Notification < ActiveRecord::Base 
  validates :status, presence: true, inclusion: { in: %w(Unread Read),
    message: "%{value} is not a valid status" }
  validates :notifiable_type, presence: true 
  validates :notifiable_id, presence: true

  belongs_to :notifiable, polymorphic: true
end
