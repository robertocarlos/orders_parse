Then(/^I shouldn't see imported orders$/) do
  expect(page).to_not have_xpath('//tbody/tr')
end

Then(/^I shouldn't see the total$/) do
  expect(page).to_not have_content(I18n.t("view.order.total"))
end

Then(/^I should see imported orders$/) do
  expect(page).to have_xpath('//tbody/tr')
  expect(page).to have_content('João Silva')
  expect(page).to have_content('R$10 off R$20 of food')
  expect(page).to have_content('R$ 10,00')
  expect(page).to have_content('2')
  expect(page).to have_content('987 Fake St')
  expect(page).to have_content("Bob's Pizza")
end

Then(/^I should see the total$/) do
  expect(page).to have_content("Total : R$ 95,00")
end

Then(/^I should see orders in (.*) order$/) do |sorting|
  ordered_names = ["Amy Pond", "João Silva", "Marty McFly", "Snake Plissken"].sort
  ordered_names = ordered_names.reverse if sorting == "descending" 
  
  all(:xpath, "//tbody/tr").each_with_index do |row, index|
    expect(row).to have_content(ordered_names[index]) 
  end
end