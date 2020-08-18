class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.references :control_tool, index: true, foreign_key: true
      t.string :sensor_presence
      t.string :sensor_lv1
      t.string :sensor_lv2
      t.string :sensor_tivl

      t.timestamps null: false
    end
  end
end
