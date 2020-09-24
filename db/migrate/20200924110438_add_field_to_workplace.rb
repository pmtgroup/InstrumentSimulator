class AddFieldToWorkplace < ActiveRecord::Migration
  def change
    add_column :workplaces, :name, :string
  end
end
