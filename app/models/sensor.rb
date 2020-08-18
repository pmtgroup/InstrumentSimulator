class Sensor < ActiveRecord::Base
  belongs_to :control_tool
  validates :sensor_presence, :sensor_lv1, :sensor_lv2, :sensor_tivl,  length: {in: 8..8}
end
