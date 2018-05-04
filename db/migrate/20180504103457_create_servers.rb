class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :serial_number
      t.string :type
      t.string :os
      t.string :ip_address
      t.string :application
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
