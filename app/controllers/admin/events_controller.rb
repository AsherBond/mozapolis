class Admin::EventsController < ApplicationController
	def index
		@events = Event.all

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @events }
		end
	end

	def new
		@artist = current_artist
		@event = @artist.events.build

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @event }
		end
	end

	def create
	  @artist = current_artist
	  @event = @artist.events.build(params[:event])
	  if @event.save
      	flash[:notice] = "<i class='icon-plus'></i> You have created a event succesfully. Wasn't that easy?".html_safe
	    redirect_to admin_events_url
	  else
	    render :action => 'new'
	  end
	end

	def edit
	  @event = Event.find(params[:id])
	end

	def update
	  @event = Event.find(params[:id])

	  respond_to do |format|
	    if @event.update_attributes(params[:event])
          format.html { redirect_to @event, notice: '<i class="icon-edit"></i> Event was successfully updated.'.html_safe }
	      format.json { head :no_content }
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @event.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		respond_to do |format|
			format.html { redirect_to admin_events_url }
			format.json { head :no_content }
		end
	end
end
