class ApplicationController < ActionController::Base

  def homepage
    session[:test] = "Você agora tem um valor na sessão"
    cookies.encrypted[:test] = "Você agora tem um valor no cookie"
  end

end
