class ChangeIntegrationTypeFields < ActiveRecord::Migration
  def change
    remove_column :integrations, :value
    remove_column :integrations, :link
    add_column :integrations, :integration_url, :string
    add_column :integrations, :name, :string

    remove_column :dashboard_integrations, :integration_url
    add_column :dashboard_integrations, :integration_id, :integer
  end
end
