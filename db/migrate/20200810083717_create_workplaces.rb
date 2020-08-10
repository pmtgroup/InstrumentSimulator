class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.string :type_vpf
      t.integer :shift_duration
      t.integer :number_of_shift
      t.references :subdivision, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
