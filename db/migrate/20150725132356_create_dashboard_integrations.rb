class CreateDashboardIntegrations < ActiveRecord::Migration
  def change
    create_table :dashboard_integrations do |t|
      t.integer :dashboard_id
      t.string :label
      t.string :integration_url

      t.timestamps null: false
    end
  end
end
