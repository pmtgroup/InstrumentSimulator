class CreateMeasurementGauges < ActiveRecord::Migration
  def change
    create_table :measurement_gauges do |t|
      t.integer :number_guage
      t.references :control_tool, index: true, foreign_key: true
      t.string :number_vibration_sensor
      t.string :number_local_vibration_sensor1
      t.string :number_local_vibration_sensor2
      t.string :number_noise_sensor
      t.string :number_infrasound_sensor

      t.timestamps null: false
    end
  end
end
