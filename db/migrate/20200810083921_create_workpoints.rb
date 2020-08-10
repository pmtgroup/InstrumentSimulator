class CreateWorkpoints < ActiveRecord::Migration
  def change
    create_table :workpoints do |t|
      t.string :name
      t.text :description
      t.string :type_vpf
      t.references :workplace, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
