class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password], params[:remember])
      flash[:success] = "Seja bem-vindo!"
      redirect_to root_path
    else
      flash.now[:warning] = 'Credenciais inválidas. Tente novamente.'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:notice] = 'Você saiu com sucesso.'
    redirect_to root_path
  end

end
