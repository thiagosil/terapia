class PatientsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])

    if @patient.save
      redirect_to @patient, notice: 'Paciente criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def edit
    @patient = Patient.new(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html  { redirect_to(@patient,
                      :notice => 'Paciente alterado com sucesso.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @friend.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
end