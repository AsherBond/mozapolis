class ApplicationController < ActionController::Base
  protect_from_forgery

  def vote_up(voteable)
    
    vote_up_msg   = "<i class='icon-thumbs-up'></i> Voted up.".html_safe
    vote_already  = "<i class='icon-flag'></i> You have voted already.".html_safe

    

    if artist_signed_in?
      # Check if they voted already.
      if current_artist.voted_on?(voteable)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the voteable.

        notify = Notification.new

        notify.notify_object = voteable.id
        notify.notify_type   = voteable.class.name
        notify.notify_type   = voteable.class.name
        notify.user_type     = "artist"
        notify.artist_id     = current_artist.id
        notify.notify_user   = voteable.artist.id
        notify.message       = "You have a new up-vote on the #{voteable.class.name.downcase} <strong>#{voteable.title}</strong>."
        
        notify.save

        current_artist.vote_for(voteable)   
        redirect_to :back, :notice => vote_up_msg
      end

    elsif fan_signed_in? 

      # Check if they voted already.
      if current_fan.voted_on?(voteable)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the voteable.
        current_fan.vote_for(voteable)   
        redirect_to :back, :notice => vote_up_msg
      end
    end

  end

  def vote_down(voteable)

    vote_down_msg = "<i class='icon-thumbs-down'></i> Voted down.".html_safe
    vote_already  = "<i class='icon-flag'></i> You have voted already.".html_safe

    if artist_signed_in?
      # Check if they voted already.
      if current_artist.voted_on?(voteable)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote against the voteable.

        notify = Notification.new

        notify.notify_object = voteable.id
        notify.notify_type   = voteable.class.name
        notify.notify_type   = voteable.class.name
        notify.user_type     = "artist"
        notify.artist_id     = current_artist.id
        notify.notify_user   = voteable.artist.id
        notify.message       = "You have a new down-vote on the #{voteable.class.name.downcase} <strong>#{voteable.title}</strong>."
        
        notify.save

        current_artist.vote_against(voteable)   
        flash[:error] = vote_down_msg
        redirect_to :back
      end

    elsif fan_signed_in? 
      
      # Check if they voted already.
      if current_fan.voted_on?(voteable)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote against the voteable.
        current_fan.vote_against(voteable)   
        redirect_to :back, :notice => vote_down_msg
      end
    end

  end

  def remove_vote(voteable)

    vote_removed = "<i class='icon-remove'></i> Vote removed!".html_safe
    never_voted  = "<i class='icon-flag'></i> You never voted!".html_safe

    if artist_signed_in?
      if current_artist.voted_on?(voteable)
        current_artist.unvote_for(voteable)
        flash[:error] = vote_removed
        redirect_to :back
      else
        flash[:error] = never_voted
        redirect_to :back
      end
    elsif fan_signed_in?
      if current_fan.voted_on?(voteable)
        current_fan.unvote_for(voteable)
        flash[:error] = vote_removed
        redirect_to :back
      else
        flash[:error] = never_voted
        redirect_to :back
      end
    end
  end

end
