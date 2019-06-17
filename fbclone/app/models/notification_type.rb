# == Schema Information
#
# Table name: notification_types
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NotificationType < ApplicationRecord
	validates :type, presence: true, inclusion: { in: %w(post_comment post_like),
    message: "%{value} is not a valid type" }
end
