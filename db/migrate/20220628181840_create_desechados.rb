class CreateDesechados < ActiveRecord::Migration[7.0]
  def change
    create_table :desechados do |t|
      t.integer :origen
      t.integer :in_1
      t.string :in_2
      t.integer :in_3
      t.string :error

      t.timestamps
    end
  end
end
