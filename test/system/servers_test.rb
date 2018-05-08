require "application_system_test_case"

class ServersTest < ApplicationSystemTestCase
  setup do
    @server = servers(:one)
  end

  test "visiting the index" do
    visit servers_url
    assert_selector "h1", text: "Servers"
  end

  test "creating a Server" do
    visit servers_url
    click_on "New Server"

    fill_in "Application", with: @server.application
    fill_in "Ip Address", with: @server.ip_address
    fill_in "Name", with: @server.name
    fill_in "Os", with: @server.os
    fill_in "Project", with: @server.project_id
    fill_in "Serial Number", with: @server.serial_number
    fill_in "Server type", with: @server.server_type
    click_on "Create Server"

    assert_text "Server was successfully created"
    click_on "Back"
  end

  test "updating a Server" do
    visit servers_url
    click_on "Edit", match: :first

    fill_in "Application", with: @server.application
    fill_in "Ip Address", with: @server.ip_address
    fill_in "Name", with: @server.name
    fill_in "Os", with: @server.os
    fill_in "Project", with: @server.project_id
    fill_in "Serial Number", with: @server.serial_number
    fill_in "Server type", with: @server.server_type
    click_on "Update Server"

    assert_text "Server was successfully updated"
    click_on "Back"
  end

  test "destroying a Server" do
    visit servers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Server was successfully destroyed"
  end
end
