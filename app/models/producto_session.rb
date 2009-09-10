class ProductoSession
  attr_accessor :nombre, :precio, :cantidad, :subtotal, :imagen, :id

  def initialize(params = {})
    params.each{|k, v| self.send("#{k}=", v) }
  end
end