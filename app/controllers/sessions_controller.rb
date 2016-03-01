class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    @session.save
    redirect_to @session
  end

  private

  def session_params
    params.require(:session).permit(:s_date, :code)
  end
end
