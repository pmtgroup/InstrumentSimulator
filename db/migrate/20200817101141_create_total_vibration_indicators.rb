class CreateTotalVibrationIndicators < ActiveRecord::Migration
  def change
    create_table :total_vibration_indicators do |t|
      t.string :terms
      t.float :boost_level_x
      t.float :boost_level_y
      t.float :boost_level_z
      t.references :staff_worker, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
