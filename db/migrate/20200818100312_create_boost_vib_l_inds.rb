class CreateBoostVibLInds < ActiveRecord::Migration
  def change
    create_table :boost_vib_l_inds do |t|
      t.float :frequency_8
      t.float :frequency_16
      t.float :frequency_31
      t.float :frequency_63
      t.float :frequency_125
      t.float :frequency_250
      t.float :frequency_500
      t.float :frequency_1000
      t.integer :type_axis
      t.references :local_vib_f_indicator, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
