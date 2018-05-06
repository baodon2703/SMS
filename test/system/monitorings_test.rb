require "application_system_test_case"

class MonitoringsTest < ApplicationSystemTestCase
  setup do
    @monitoring = monitorings(:one)
  end

  test "visiting the index" do
    visit monitorings_url
    assert_selector "h1", text: "Monitorings"
  end

  test "creating a Monitoring" do
    visit monitorings_url
    click_on "New Monitoring"

    fill_in "Content", with: @monitoring.content
    fill_in "Critical", with: @monitoring.critical
    fill_in "Failure Flow", with: @monitoring.failure_flow
    fill_in "Interval", with: @monitoring.interval
    fill_in "Name", with: @monitoring.name
    fill_in "Other", with: @monitoring.other
    fill_in "Retry Num", with: @monitoring.retry_num
    fill_in "Route", with: @monitoring.route
    fill_in "Timeout", with: @monitoring.timeout
    fill_in "Tool", with: @monitoring.tool
    fill_in "Warning", with: @monitoring.warning
    click_on "Create Monitoring"

    assert_text "Monitoring was successfully created"
    click_on "Back"
  end

  test "updating a Monitoring" do
    visit monitorings_url
    click_on "Edit", match: :first

    fill_in "Content", with: @monitoring.content
    fill_in "Critical", with: @monitoring.critical
    fill_in "Failure Flow", with: @monitoring.failure_flow
    fill_in "Interval", with: @monitoring.interval
    fill_in "Name", with: @monitoring.name
    fill_in "Other", with: @monitoring.other
    fill_in "Retry Num", with: @monitoring.retry_num
    fill_in "Route", with: @monitoring.route
    fill_in "Timeout", with: @monitoring.timeout
    fill_in "Tool", with: @monitoring.tool
    fill_in "Warning", with: @monitoring.warning
    click_on "Update Monitoring"

    assert_text "Monitoring was successfully updated"
    click_on "Back"
  end

  test "destroying a Monitoring" do
    visit monitorings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Monitoring was successfully destroyed"
  end
end
