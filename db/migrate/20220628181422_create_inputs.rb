class CreateInputs < ActiveRecord::Migration[7.0]
  def change
    create_table :inputs do |t|
      t.integer :in_0
      t.string :in_1
      t.integer :in_2

      t.timestamps
    end
    add_index :inputs, :in_0, :unique => true

  end
end
