class ChangeTypeToServers < ActiveRecord::Migration[5.2]
  def change
    rename_column :servers, :type, :server_type
  end
end
