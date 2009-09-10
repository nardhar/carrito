# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def login
    if params[:controller] == "sessions" and params[:action] != "destroy" 
      
    elsif session[:usuario]
      render :partial => "/sessions/logged"
    else
      render :partial => "/sessions/login"
    end
  end
  
end
