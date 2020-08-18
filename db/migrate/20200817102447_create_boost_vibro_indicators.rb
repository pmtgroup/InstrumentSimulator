class CreateBoostVibroIndicators < ActiveRecord::Migration
  def change
    create_table :boost_vibro_indicators do |t|
      t.float :frequency_1
      t.float :frequency_2
      t.float :frequency_4
      t.float :frequency_8
      t.float :frequency_16
      t.float :frequency_31
      t.float :frequency_63
      t.integer :type_axis
      t.references :total_vibration_indicator, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
