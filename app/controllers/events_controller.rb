class EventsController < ApplicationController
	before_filter :edit_event
	before_filter :find_user
	include EventsHelper
   	private
	def params_event
		params.require(:event).permit(:event,:venue,:date,:time,:description,:invitee,:status)
	end
	def edit_event

		@event = Event.find_by_id(params[:event_id])
	end

	def find_user
		@user=User.find_by_id(params[:user_id])
	end
end

