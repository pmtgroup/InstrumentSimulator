class CreateRegisterSignals < ActiveRecord::Migration
  def change
    create_table :register_signals do |t|
      t.string :number_register
      t.references :control_tool, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
