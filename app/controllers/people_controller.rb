class PeopleController < ApplicationController
  before_filter :check_authentication

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    family = @person.build_family
    6.times { family.children.build }
  end

  def create
    @person = Person.new(params[:person])

    if @person.save
      redirect_to @person, notice: 'Pessoa criada com sucesso.'
    else
      render action: 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    params[:person]['birthday(1i)'] = round_birthday(params[:person]['birthday(1i)'])
    params[:person]['birthday(2i)'] = round_birthday(params[:person]['birthday(2i)'])
    params[:person]['birthday(3i)'] = round_birthday(params[:person]['birthday(3i)'])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html  { redirect_to(@person,
                      :notice => 'Pessoa alterada com sucesso.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @person.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  private
    def round_birthday(param)
      date = param.to_i
      if date == 0
        date = 1
      end
      date.to_s
    end
end
