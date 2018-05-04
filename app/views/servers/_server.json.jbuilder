json.extract! server, :id, :name, :serial_number, :type, :os, :ip_address, :application, :project_id, :created_at, :updated_at
json.url server_url(server, format: :json)
