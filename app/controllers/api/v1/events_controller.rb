module Api
  module V1
    class EventsController < ApplicationController
      before_action :event_params, only: [:create]
      def index
        render json: Event.all
      end
      def create
        event = Event.new(event_params)
        if event.save
          render json: event
        else
          render json: {message: event.errors.messages}
        end
      
      end
      def show
        event = Event.find(params[:id])
        render json: event
      end

      private
      
      def event_params
        params.permit(:id, :name, :start, :end, :timed, :description, :color)
      end
    end
  end
end
