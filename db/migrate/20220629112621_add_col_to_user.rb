# frozen_string_literal: true

# AddColToUser
class AddColToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :description, :string
    add_column :users, :website, :string
  end
end
