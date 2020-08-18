class CreateStaffWorkers < ActiveRecord::Migration
  def change
    create_table :staff_workers do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.references :subdivision, index: true, foreign_key: true
      t.date :birthday
      t.date :duration_work
      t.string :labor_activity_type
      t.string :labor_activity_category
      t.integer :duration_one_shift
      t.references :workplace, index: true, foreign_key: true
      t.integer :work_in_workplace
      t.text :description_operation
      t.integer  :additional_workplace_id
      t.integer :additional_work_in_workplace
      t.text :additional_description_operation

      t.timestamps null: false
    end
    add_index :staff_workers, :additional_workplace_id
  end
end
