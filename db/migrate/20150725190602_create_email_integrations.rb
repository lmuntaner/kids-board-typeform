class CreateEmailIntegrations < ActiveRecord::Migration
  def change
    create_table :email_integrations do |t|
      t.string :label
      t.string :email
      t.string :body
      t.integer :dashboard_id

      t.timestamps null: false
    end
  end
end
