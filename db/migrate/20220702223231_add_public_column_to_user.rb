# frozen_string_literal: true

# AddPublicColumnToUser
class AddPublicColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_public, :boolean, default: true
  end
end
