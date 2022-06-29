class CreateOutputs < ActiveRecord::Migration[7.0]
  def change
    create_table :outputs do |t|
      t.integer :out_0
      t.string :out_1 

      t.timestamps
    end
    add_index :outputs, :out_0, :unique => true

  end
end
