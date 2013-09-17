class FriendsController < ApplicationController
  before_filter :authenticate_user!

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


    if @friend.save
      redirect_to @friend, notice: 'Amigo/Servo criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def edit
    @friend = Friend.find(params[:id])

    (6 - @friend.family.children.size).times { @friend.family.children.build }
  end

  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html  { redirect_to(@friend,
                      :notice => 'Amigo/Servo alterado com sucesso.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @friend.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :no_content }
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end
end
