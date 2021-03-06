class EventsController < ApplicationController
  before_action :authenticate_user!, except: :show
  PER = 3
  
  def index
    @q = Event.page(params[:page]).per(PER).order(:start_time).ransack(search_params)
    @events = @q.result(distinct: true)
  end
  
  def new
    @event = current_user.create_events.build
    @categories = Category.all
  end
  
  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets.includes(:user).order(:created_at)
    @ticket = current_user && current_user.tickets.find_by(event_id: params[:id])
    @category = @event.category
  end
  
  def create
    @event = current_user.create_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "作成しました" 
    else
      render :new
    end
  end
  
  def edit
    @event = current_user.create_events.find(params[:id])
    @categories = Category.all
  end
  
  def update
    @event = current_user.create_events.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event, notice: "更新しました"
    else
      render :edit
    end
  end
  
  def destroy
    @event = current_user.create_events.find(params[:id]) 
    @event.destroy!
    redirect_to root_path, notice: "削除しま���た"
  end
  
  private
  
    def event_params
      params.require(:event).permit(:name, :place, :event_image, :event_image_cache, :remove_event_image, :content, :start_time, :end_time, :category_id) 
    end
    
    def search_params
      params.require(:q).permit(:name_cont, :start_time_gteq)
    rescue 
      { start_time_gteq: Time.zone.now }
    end
end
