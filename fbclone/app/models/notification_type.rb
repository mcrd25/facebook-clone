# == Schema Information
#
# Table name: notification_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NotificationType < ApplicationRecord
	validates :name, presence: true, inclusion: { in: %w(post_comment post_like),
    message: "%{value} is not a valid name" }

  has_many :notifications
end
