class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  before_action :check_logged_in, :only => [:new, :create]

  def index
    @events=Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    event_parmas = params.require(:event).permit(:artist, :description,:price_low, :price_high, :event_date)
    @event = Event.new(event_parmas)
    if @event.save
      flash[:komunikat] = 'Event został poprawnie stworzony.'
      redirect_to "/events/#{@event.id}"
    else
      render 'new'
    end
  end

  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
      username == "admin" && password == "admin"
    end
  end

  def correct_user
    @event = current_user.tickets.find_by(id: params[:id])
    redirect_to events_path, notice: "Nie jesteś uprawniony do edycji tego eventu" if @event.nil?
  end
end
