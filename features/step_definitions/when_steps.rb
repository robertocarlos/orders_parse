When(/^I submit no file$/) do
  # click button send without choose a file
  click_button I18n.t("view.order.send")
end

When(/^I submit invalid file$/) do
  find(:xpath, "//input[@id='uploaded_file']").set("spec/fixtures/invalid_file.txt")
  click_button I18n.t("view.order.send")
end

When(/^I submit valid file$/) do
  find(:xpath, "//input[@id='uploaded_file']").set("spec/fixtures/valid_file.txt")  
  click_button I18n.t("view.order.send")
end

When(/^I click link on buyer field in header table$/) do
  click_link I18n.t("order.buyer")
end

When(/^I click link on supplier field in header table$/) do
  click_link I18n.t("order.supplier")
end