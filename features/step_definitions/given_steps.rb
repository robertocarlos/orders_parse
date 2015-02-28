Given(/^I visit the home$/) do
  visit "/"
end

Given(/^I click link to import a file$/) do
  click_link I18n.t("view.order.import")
end