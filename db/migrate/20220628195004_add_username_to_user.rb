class AddUsernameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:firstname, :string ,limit: 20
    add_column :users,:lastname, :string ,limit: 20
    add_column :users,:username, :string ,limit: 20
  end
end
