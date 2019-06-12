# == Schema Information
#
# Table name: friendships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  requestee_id :integer
#  requester_id :integer
#
# Indexes
#
#  index_friendships_on_requestee_id                   (requestee_id)
#  index_friendships_on_requester_id                   (requester_id)
#  index_friendships_on_requester_id_and_requestee_id  (requester_id,requestee_id) UNIQUE
#

class Friendship < ApplicationRecord
end
