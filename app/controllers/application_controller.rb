# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  layout proc{|controller| controller.request.xhr? ? :false :"application"}

  before_filter :crear_carrito

  before_filter :adicionar_paginacion

  protected
  def crear_carrito
    session[:carrito] = CarritoSession.new if session[:carrito].nil?
  end
  def adicionar_paginacion
    @page = params[:page] or 1
  end
end
