class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.string :dashboard_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
