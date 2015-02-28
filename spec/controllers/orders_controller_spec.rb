require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "index" do
    let!(:order) { FactoryGirl.create(:order) }
    
    subject { get :index }
    
    it "assigns @orders" do
      subject
      expect(assigns(:orders)).to eq([order])
    end
    
    it "assigns @total" do
      subject
      expect(assigns(:total)).to eq(order.total_price)
    end
    
    it "retuns 200 status code" do
      subject
      expect(response.status).to eq(200)
    end
  end
  
  describe "create" do
    subject { post :create, { :uploaded_file => file } }
    
    context "when submit invalid file" do
      let(:file) { Rack::Test::UploadedFile.new("spec/fixtures/invalid_file.txt") }
      
      it { expect(subject).to redirect_to(orders_url) }
      it { expect(Order.count).to eql(0) }
    end
    
    context "when submit valid file" do
      let(:file) { Rack::Test::UploadedFile.new("spec/fixtures/valid_file.txt") }
    
      it { expect(subject).to redirect_to(orders_url) }
      it { expect { subject }.to change{ Order.count }.by(4) }
    end
  end
end
