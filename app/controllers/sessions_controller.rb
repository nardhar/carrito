class SessionsController < ApplicationController

  def new
  end

  def create
    u = Usuario.find_by_login(params[:login])
    if u and u.password == Digest::SHA1.hexdigest(params[:password])
      session[:usuario] = {:id => u.id, :nombre_completo => u.nombre_completo, :tipo => u.tipo}
      flash[:notice] = "Usted ha ingresado correctamente"
      redirect_to "/"
    else
      flash[:notice] = "Usted ha ingresado un login o password incorrecto"
      render "new"
    end
  end

  def destroy
    session[:usuario] = nil
    redirect_to "/"
  end

  def show
    unless session[:usuario].nil?
      @usuario = Usuario.find(session[:usuario][:id])
      render "/usuarios/show"
    else
      redirect_to "/"
    end
  end
end