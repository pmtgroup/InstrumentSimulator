class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :full_name
      t.string :inn
      t.string :orgn
      t.string :kind_of_action
      t.text :location

      t.timestamps null: false
    end
  end
end
