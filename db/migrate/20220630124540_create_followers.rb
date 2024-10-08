# frozen_string_literal: true

# CreateFollowers
class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :follower, references: :users
      t.references :following, references: :users
      t.timestamps
    end
  end
end
