class CreateWorkingOperations < ActiveRecord::Migration
  def change
    create_table :working_operations do |t|
      t.references :staff_worker, index: true, foreign_key: true
      t.date :date_of_operation
      t.integer :duration_shift

      t.timestamps null: false
    end
  end
end
