class SessionsController < ApplicationController
  def new

  end

  def create
    u = Usuario.find_by_login(params[:login])
    if u and u.password == Digest::SHA1.hexdigest(params[:password])
      session[:usuario] = {:id => u.id, :nombre_completo => u.nombre_completo}
      flash[:notice] = "Usted ha ingresado correctamente"
      redirect_to "/"
    else
      flash[:notice] = "Usted ha ingresado un login o password incorrecto"
      render "new"
    end
  end

  def destroy
    
  end
end