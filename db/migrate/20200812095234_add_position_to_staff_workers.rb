class AddPositionToStaffWorkers < ActiveRecord::Migration
  def change
    add_column :staff_workers, :position, :string
  end
end
