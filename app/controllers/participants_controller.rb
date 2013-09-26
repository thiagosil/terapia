class ParticipantsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :json

  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(params[:participant])

    flash[:notice] = 'Participante criado com sucesso.' if @participant.save
    respond_with(@participant)
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])

    flash[:notice] = 'Participante alterado com sucesso.' if @participant.save
    respond_with(@participant)
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    flash[:notice] = "Participante removido com sucesso."
    respond_with(@participant)
  end

  def show
    @participant = Participant.find(params[:id])
  end
end
