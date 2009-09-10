class CarritoSessionsController < ApplicationController
  def index
    @carrito = session[:carrito]
  end
  
  def new
    session[:carrito].add(params[:id])
    redirect_to "/carrito_sessions/"
  end

  def destroy
    session[:carrito].delete(params[:id])
    redirect_to "/carrito_sessions/"
  end

  def update
    params[:carrito].each do |c|
      session[:carrito].update(c[:id],c[:cantidad])
    end
    redirect_to "/carrito_sessions/"
  end
end