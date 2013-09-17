class ParticipantsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new
  end

  def create
    set_date_fields(params)
    @participant = Participant.new(params[:participant])


    if @participant.save
      redirect_to @participant, notice: 'Participante criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])

    respond_to do |format|
      if @participant.update_attributes(params[:participant])
        format.html  { redirect_to(@participant,
                      :notice => 'Participante alterado com sucesso.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @participant.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end

  def show
    @participant = Participant.find(params[:id])
  end
end
