class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = Session.all
  end

  def show
  end

  def edit
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      redirect_to sessions_path
    else
      render 'new'
    end
  end

  def update
    if @session.update(session_params)
      redirect_to @session
    else
      render 'edit'
    end
  end

  def destroy
    @session.destroy

    redirect_to sessions_path
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:s_date, :code)
  end
end
