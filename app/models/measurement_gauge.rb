class MeasurementGauge < ActiveRecord::Base
  belongs_to :control_tool
  validates :number_vibration_sensor, :number_local_vibration_sensor1, :number_local_vibration_sensor2, :number_noise_sensor, :number_infrasound_sensor,  length: {in: 8..8}
end
