class CarritoSession
  attr_accessor :lista, :total

  def initialize
    @lista = []
    @total = 0
  end
  
  def lista_productos
    self.total = 0
    productos = Producto.all :conditions => {:id => lista.map{|v| v[:producto_id]}}
    lista.inject([]) do |arr, v|
      prod = productos.select{|pr| pr.id == v[:producto_id].to_i}[0]
      self.total += v[:cantidad].to_i * prod.precio
      arr << ProductoSession.new(:nombre => prod.nombre,
        :imagen => prod.foto.url(:small),
        :precio => prod.precio,
        :cantidad => v[:cantidad],
        :id => prod.id,
        :subtotal => v[:cantidad].to_i * prod.precio)
      arr
    end
  end

  def add(producto_id, cantidad = 1)
    unless existe?(producto_id)
      lista << {:producto_id => producto_id, :cantidad => cantidad}
    end
  end

  def update(producto_id, cantidad = 1)
    if cantidad == 0
      self.lista.delete(buscar_en_lista(producto_id))
    else
      buscar_en_lista(producto_id)[:cantidad] = cantidad.to_i
    end
  end

  def delete(producto_id)
    self.lista.delete(buscar_en_lista(producto_id))
  end

  protected
  def existe?(producto_id)
    lista.select{|v| v[:producto_id] == producto_id }.size == 1
  end

  def buscar_en_lista(producto_id)
    self.lista.select{|v| v[:producto_id] == producto_id }[0]
  end

end