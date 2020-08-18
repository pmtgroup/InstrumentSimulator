class WorkingOperation < ActiveRecord::Base
  belongs_to :staff_worker
  has_many :noise_indicators
  has_many :local_vib_f_indicators
  has_many :local_vib_s_indicators
  has_many :total_vibration_indicators
end
