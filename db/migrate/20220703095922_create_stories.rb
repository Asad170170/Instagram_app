# frozen_string_literal: true

# CreateStories
class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.references :user
      t.timestamps
    end
  end
end
