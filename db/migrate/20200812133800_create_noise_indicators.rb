class CreateNoiseIndicators < ActiveRecord::Migration
  def change
    create_table :noise_indicators do |t|
      t.string :terms
      t.float :frequency_31
      t.float :frequency_63
      t.float :frequency_125
      t.float :frequency_250
      t.float :frequency_500
      t.float :frequency_1000
      t.float :frequency_2000
      t.float :frequency_4000
      t.float :frequency_8000
      t.references :staff_worker, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_column :noise_indicators, :min_lvl, :float
    add_column :noise_indicators, :max_lvl, :float
    add_column :noise_indicators, :pulse_noise, :float
    add_column :noise_indicators, :peak_lvl, :float
    add_column :noise_indicators, :equivalent_lvl, :float
    add_column :noise_indicators, :character_noise, :string
  end
end
