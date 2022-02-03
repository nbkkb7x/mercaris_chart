require "application_system_test_case"

class ChartsTest < ApplicationSystemTestCase
  setup do
    @chart = charts(:one)
  end

  test "visiting the index" do
    visit charts_url
    assert_selector "h1", text: "Charts"
  end

  test "should create chart" do
    visit charts_url
    click_on "New chart"

    click_on "Create Chart"

    assert_text "Chart was successfully created"
    click_on "Back"
  end

  test "should update Chart" do
    visit chart_url(@chart)
    click_on "Edit this chart", match: :first

    click_on "Update Chart"

    assert_text "Chart was successfully updated"
    click_on "Back"
  end

  test "should destroy Chart" do
    visit chart_url(@chart)
    click_on "Destroy this chart", match: :first

    assert_text "Chart was successfully destroyed"
  end
end
