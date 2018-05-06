require 'test_helper'

class MonitoringTest < ActiveSupport::TestCase
  def setup
    @server = servers(:server)
    @monitoring = @server.monitorings.build(name: "Monitoring a")
  end

  test "should be valid" do
    assert @monitoring.valid?
  end

  test "server id should be present" do
    @monitoring.server_id = nil
    assert_not @monitoring.valid?
  end

  test "name should be present" do
    @monitoring.name = "   "
    assert_not @monitoring.valid?
  end
end
