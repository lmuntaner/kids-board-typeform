class CreateSetupForms < ActiveRecord::Migration
  def change
    create_table :setup_forms do |t|
      t.string :form_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
