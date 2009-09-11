class ComprasController < ApplicationController

  def new
    @carrito = session[:carrito]
    @compra = Compra.new
  end

  def create
    @compra = Compra.new(:total => session[:carrito].total,
                         :usuario_id => session[:usuario][:id],
                         :fecha => DateTime.now
    )
    @compra.compra_detalles_attributes = session[:carrito].lista

    if @compra.save
      session[:carrito].borrar
      flash[:notice] = "Se ha guardado su compra correctamente"
      redirect_to "/"
    else
      flash[:notice] = "No se pudo guardar su compra, intente de nuevo"
      @carrito = session[:carrito]
      render "new"
    end
  end

  def show
    
  end

  def edit

  end

  def update

  end
end