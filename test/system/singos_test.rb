require "application_system_test_case"

class SingosTest < ApplicationSystemTestCase
  setup do
    @singo = singos(:one)
  end

  test "visiting the index" do
    visit singos_url
    assert_selector "h1", text: "Singos"
  end

  test "creating a Singo" do
    visit singos_url
    click_on "New Singo"

    fill_in "Content", with: @singo.content
    fill_in "Item", with: @singo.item_id
    fill_in "Sel", with: @singo.sel
    fill_in "User", with: @singo.user_id
    click_on "Create Singo"

    assert_text "Singo was successfully created"
    click_on "Back"
  end

  test "updating a Singo" do
    visit singos_url
    click_on "Edit", match: :first

    fill_in "Content", with: @singo.content
    fill_in "Item", with: @singo.item_id
    fill_in "Sel", with: @singo.sel
    fill_in "User", with: @singo.user_id
    click_on "Update Singo"

    assert_text "Singo was successfully updated"
    click_on "Back"
  end

  test "destroying a Singo" do
    visit singos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Singo was successfully destroyed"
  end
end
