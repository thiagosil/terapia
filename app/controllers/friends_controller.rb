class FriendsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :json

  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
    family = @friend.build_family
    6.times { family.children.build }
  end

  def create
    @friend = Friend.new(params[:friend])

    flash[:notice] = 'Amigo criado com sucesso.' if @friend.save
    respond_with(@friend)
  end

  def edit
    @friend = Friend.find(params[:id])

    (6 - @friend.family.children.size).times { @friend.family.children.build }
  end

  def update
    @friend = Friend.find(params[:id])
    flash[:notice] = 'Amigo/Servo alterado com sucesso.' if @friend.update_attributes(params[:friend])
    respond_with(@friend)
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    flash[:notice] = "Amigo removido com sucesso."
    respond_with(@friend)
  end

  def show
    @friend = Friend.find(params[:id])
  end
end
