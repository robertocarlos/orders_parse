FactoryGirl.define do
  factory :order do
    buyer       "João Silva"
    description "R$10 off R$20 of food"
    unit_price  11.98
    quantity    4
    supplier    "Bob's Pizza"
    address     "987 Fake St"
  end
end
