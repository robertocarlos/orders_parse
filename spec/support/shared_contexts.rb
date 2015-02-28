shared_context "order saved correctly" do |encoding|
  let(:raw_data) do 
    [buyer, description, unit_price, quantity, address, supplier].join("\t").force_encoding(encoding)
  end
  
  it "should create order" do
    expect { subject }.to change{ Order.count }.by(1)
  end
  
  [:buyer, :description, :address, :supplier, :total_price].each do |attribute|
    it "should save #{attribute}" do
      expect(subject.send(attribute)).to eql self.send(attribute)
    end
  end
  
  it "should save unit_price" do
    expect(subject.unit_price).to eql unit_price.to_f
  end
  
  it "should save quantity" do
    expect(subject.quantity).to eql quantity.to_i
  end
end
