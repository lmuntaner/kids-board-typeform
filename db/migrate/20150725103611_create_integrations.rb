class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.integer :field_number
      t.integer :value
      t.integer :link

      t.timestamps null: false
    end
  end
end
