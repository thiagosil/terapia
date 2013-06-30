#encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Acesso realizado com sucesso!"
    else
      flash[:notice] = 'Email ou senha inválidos'
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Desconectado com sucesso!"
  end
end
