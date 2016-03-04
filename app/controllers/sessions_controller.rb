class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def edit
    @session = Session.find(params[:id])
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
    @session = Session.find(params[:id])

    if @session.update(session_params)
      redirect_to @session
    else
      render 'edit'
    end
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy

    redirect_to sessions_path
  end

  private

  def session_params
    params.require(:session).permit(:s_date, :code)
  end
end
