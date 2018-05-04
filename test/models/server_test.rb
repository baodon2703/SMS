require 'test_helper'

class ServerTest < ActiveSupport::TestCase
  def setup
    @project = projects(:project)
    @server = @project.servers.build(name: "Server a")
  end

  test "should be valid" do
    assert @server.valid?
  end

  test "project id should be present" do
    @server.project_id = nil
    assert_not @server.valid?
  end

  test "name should be present" do
    @server.name = "   "
    assert_not @server.valid?
  end
end
