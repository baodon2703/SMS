json.extract! monitoring, :id, :name, :content, :warning, :critical, :failure_flow, :interval, :retry_num, :timeout, :route, :other, :tool, :created_at, :updated_at
json.url monitoring_url(monitoring, format: :json)
