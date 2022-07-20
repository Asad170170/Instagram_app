# frozen_string_literal: true

# RenameColmsForComments
class RenameColmsForComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :posts_id, :post_id
  end
end
