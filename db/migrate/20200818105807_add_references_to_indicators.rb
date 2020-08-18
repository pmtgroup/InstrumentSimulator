class AddReferencesToIndicators < ActiveRecord::Migration
  def change
    add_reference :noise_indicators, :working_operation, index: true, foreign_key: true
    add_reference :total_vibration_indicators, :working_operation, index: true, foreign_key: true
    add_reference :local_vib_f_indicators, :working_operation, index: true, foreign_key: true
    add_reference :local_vib_s_indicators, :working_operation, index: true, foreign_key: true
  end
end
