class CreateControlTools < ActiveRecord::Migration
  def change
    create_table :control_tools do |t|
      t.references :workpoint, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
