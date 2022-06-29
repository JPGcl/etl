class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.integer :log_0
      t.string :origen
      t.string :in_1
      t.string :in_2
      t.string :in_3
      t.string :error

      t.timestamps
    end
  end
end
