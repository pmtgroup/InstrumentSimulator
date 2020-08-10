class CreateSubdivisions < ActiveRecord::Migration
  def change
    create_table :subdivisions do |t|
      t.string :name
      t.string :full_name
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
