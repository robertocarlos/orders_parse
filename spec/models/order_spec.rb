require 'rails_helper'

describe Order, type: :model do
  describe "validations" do
    it { expect(subject).to validate_presence_of :buyer }
    it { expect(subject).to validate_presence_of :description }
    it { expect(subject).to validate_presence_of :supplier }
    it { expect(subject).to validate_presence_of :unit_price }
    it { expect(subject).to validate_presence_of :quantity }
    it { expect(subject).to validate_presence_of :address }
  end
  
  describe "#create_from" do
    subject { Order.create_from(raw_data) }
    
    context "with invalid data" do
      let(:raw_data) { "" }
      
      it "should not create buyer" do 
        expect(Order.count).to eql(0)
      end
    end
    
    context "with valid data" do
      let(:buyer)       { "João Silva" }
      let(:description) { "R$10 off R$20 of food" }
      let(:unit_price)  { "11.98" }
      let(:quantity)    { "4" }
      let(:supplier)    { "Bob's Pizza" }
      let(:address)     { "987 Fake St" }
      let(:total_price) { quantity.to_i * unit_price.to_f }
      
      context "and UTF-8 encoing" do
        include_context "order saved correctly", "UTF-8"
      end
     
      context "and ASCII-8BIT encoing" do
        include_context "order saved correctly", "ASCII-8BIT"
      end
    end
  end
end
