require "application_system_test_case"

class IndexTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit pages_index_url
  
    assert_selector "#age-input"
    assert_selector "#age-label"
  end
  test "fill valid year" do
    visit pages_index_url
  
    age_input = find "#age-input"
    age_label = find "#age-label"
    age_input.fill_in with: "2000"
    page.find("body").click
    age_label_str = age_label['innerHTML']
    year = Date.today.year
    age = year - 2000
    assert age_label_str.include? "Age: #{age}"
  end

  test "fill under 18" do
    visit pages_index_url
  
    age_input = find "#age-input"
    age_label = find "#age-label"
    year = Date.today.year
    age_input.fill_in with: "#{year - 10}"
    page.find("body").click
    age_label_str = age_label['innerHTML']
    age = year - 2000
    assert age_label_str.include? "Age: 10"
    assert_selector "#age-label.text-red-500"
  end

  test "fill invalid year" do
    visit pages_index_url
  
    age_input = find "#age-input"
    age_label = find "#age-label"
    year = Date.today.year
    age_input.fill_in with: "#{year + 10}"
    page.find("body").click
    age_label_str = age_label['innerHTML']
    age = year - 2000
    assert age_label_str.include? "Age: Invalid"
    assert_selector "#age-label.text-red-500"
  end
end
