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
    set_date_fields(params)
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
    set_date_fields(params)
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

  private
    def set_date_fields(params)
      date_fields = %w{ birthday identity_expedition_date beginning_date end_date}
      date_fields.each do |date_field|
        set_date(date_field, params)
      end
    end

    def set_date(field_name, params)
      year =  round_birthday(params[:friend]["#{field_name}(1i)"])
      month = round_birthday(params[:friend]["#{field_name}(2i)"])
      day = round_birthday(params[:friend]["#{field_name}(3i)"])

      params[:friend][field_name] = Date.new(year, month, day)
      params[:friend].delete("#{field_name}(1i)")
      params[:friend].delete("#{field_name}(2i)")
      params[:friend].delete("#{field_name}(3i)")
    end

    def round_birthday(param)
      date = param.to_i
      if date == 0
        date = 1
      end
      date
    end
end
