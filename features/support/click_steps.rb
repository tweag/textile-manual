When(/^I click on the getting started link$/) do
  within(:css, ".content") do
    click_link("Writing Paragraph Text")
  end
end

When(/^I click "([^"]*)" in the TOC$/) do |text|
  within(:css, ".table-of-contents") do
    click_link text
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_path|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == page_path
  else
    assert_equal page_path, current_path
  end
end
