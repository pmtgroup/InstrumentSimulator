class AddDescriptionFileToWorkpoint < ActiveRecord::Migration
  def change
    add_column :workpoints, :description_file, :string
  end
end
