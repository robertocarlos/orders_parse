class Order < ActiveRecord::Base
  validates :buyer, :address, :supplier, :unit_price, :quantity, :description, :presence => true
  
  before_create :set_total_price
  
  def self.create_from(data)
    buyer, description, unit_price, quantity, address, supplier = data.split("\t").map do |attribute|
      normalize(attribute)
    end
    
    Order.create({
      :buyer       => buyer, 
      :description => description,
      :unit_price  => unit_price.to_f,
      :quantity    => quantity.to_i, 
      :address     => address, 
      :supplier    => supplier
    })
  end
  
  private
    
    def set_total_price
      self.total_price = self.unit_price * self.quantity
    end
    
    def self.normalize(attribute)
      if attribute.encoding.name == "ASCII-8BIT" 
        attribute.encode("ASCII-8BIT").force_encoding("UTF-8")
      else
        attribute.force_encoding("UTF-8")
      end
    end
    
    private_class_method :normalize
end
