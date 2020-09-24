class AddFieldsToAllModel < ActiveRecord::Migration
  def change
    add_column :staff_workers, :number_id, :string
    add_column :companies, :number_id, :string
    add_column :subdivisions, :number_id, :string
    add_column :workplaces, :number_id, :string
    add_column :workpoints, :number_id, :string
    add_column :workpoints, :uniq_number_id, :string
  end
end
