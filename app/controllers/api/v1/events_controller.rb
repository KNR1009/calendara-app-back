module Api
  module V1
    class EventsController < ApplicationController
      before_action :event_params, only: [:create, :update]
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

      def update
        event = Event.find(params[:id])
        if event.update(event_params)
          render json: {messages: "更新しました"}
        else
          render json: {message: event.errors.messages}
        end
      end

      def destroy
        event = Event.find(params[:id])
        if event.delete
          render json: {message: "削除しました"}
        else
          render json: {messages: "削除に失敗しました"}
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
