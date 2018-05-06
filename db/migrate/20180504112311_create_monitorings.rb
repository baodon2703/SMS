class CreateMonitorings < ActiveRecord::Migration[5.2]
  def change
    create_table :monitorings do |t|
      t.string :name
      t.string :content
      t.string :warning
      t.string :critical
      t.string :failure_flow
      t.integer :interval
      t.integer :retry_num
      t.integer :timeout
      t.string :route
      t.string :other
      t.string :tool
      t.references :server, foreign_key: true

      t.timestamps
    end
  end
end
