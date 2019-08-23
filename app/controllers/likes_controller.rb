class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    like = current_user.likes.new(event_id: params[:event_id])
    like.save
    redirect_to @event
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    unlike = current_user.likes.find_by(event_id: params[:event_id])
    unlike.destroy
    redirect_to @event
  end
end
