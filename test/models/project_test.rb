require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @user = users(:don)
    @project = @user.projects.build(name: "Project a")
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "user id should be present" do
    @project.user_id = nil
    assert_not @project.valid?
  end

  test "name should be present" do
    @project.name = "   "
    assert_not @project.valid?
  end
end

