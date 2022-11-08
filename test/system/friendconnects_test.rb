require "application_system_test_case"

class FriendconnectsTest < ApplicationSystemTestCase
  setup do
    @friendconnect = friendconnects(:one)
  end

  test "visiting the index" do
    visit friendconnects_url
    assert_selector "h1", text: "Friendconnects"
  end

  test "creating a Friendconnect" do
    visit friendconnects_url
    click_on "New Friendconnect"

    fill_in "Create", with: @friendconnect.create
    fill_in "Destroy", with: @friendconnect.destroy
    fill_in "Friend", with: @friendconnect.friend_id
    fill_in "User", with: @friendconnect.user_id
    click_on "Create Friendconnect"

    assert_text "Friendconnect was successfully created"
    click_on "Back"
  end

  test "updating a Friendconnect" do
    visit friendconnects_url
    click_on "Edit", match: :first

    fill_in "Create", with: @friendconnect.create
    fill_in "Destroy", with: @friendconnect.destroy
    fill_in "Friend", with: @friendconnect.friend_id
    fill_in "User", with: @friendconnect.user_id
    click_on "Update Friendconnect"

    assert_text "Friendconnect was successfully updated"
    click_on "Back"
  end

  test "destroying a Friendconnect" do
    visit friendconnects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friendconnect was successfully destroyed"
  end
end
