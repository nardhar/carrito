class CatalogoController < ApplicationController
  def index
    @productos = Producto.paginate(:page => @page)
  end
  
  def show
    @producto = Producto.find(params[:id])
  end
end
