class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      authenticate
      redirect_to root_url, :notice => "Cadastro realizado com sucesso!"
    else
      render "new"
    end
  end

  private

  def authenticate
    user = User.authenticate(@user.email, @user.password)
    session[:user_id] = user.id
  end
end
