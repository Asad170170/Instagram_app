# frozen_string_literal: true

# Follower
class Follower < ApplicationRecord
  # belongs_to :user
  validates :follower_id, uniqueness: { scope: :following_id }
end
