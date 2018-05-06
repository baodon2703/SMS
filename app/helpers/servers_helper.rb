module ServersHelper
  def current_project
    Project.find(@server.project_id)
  end
end
