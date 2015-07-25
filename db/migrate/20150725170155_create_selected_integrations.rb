class CreateSelectedIntegrations < ActiveRecord::Migration
  def change
    create_table :selected_integrations do |t|
      t.integer :dashboard_id
      t.string :label

      t.timestamps null: false
    end
  end
end
