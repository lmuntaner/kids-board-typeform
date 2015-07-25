class AddUserToSelectedIntegration < ActiveRecord::Migration
  def change
    add_column :selected_integrations, :user_id, :integer
  end
end
