# frozen_string_literal: true

class AddAcceptedToFollowers < ActiveRecord::Migration[5.2]
  def change
    add_column :followers, :accepted, :boolean
  end
end
