class CatalogoController < ApplicationController
  def index
    @productos = Producto.paginate(:page => @page)
  end
end
