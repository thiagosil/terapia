class PeopleController < ApplicationController
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

    respond_with(@person)
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    respond_with(@person)
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_with(@person)
  end

  def show
    @person = Person.find(params[:id])
  end
end
