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

class Notification < ApplicationRecord
	validates :notification_type_id, presence: true
  validates :reference_id, presence: true
end
