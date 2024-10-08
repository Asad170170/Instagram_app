# frozen_string_literal: true

# RenameUsersIdToUserId
class RenameUsersIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :users_id, :user_id
  end
end
