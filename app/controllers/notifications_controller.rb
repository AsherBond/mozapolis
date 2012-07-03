class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(:notify_user => current_artist.id).order("created_at desc")
  end
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.json { head :no_content }
    end
  end
end
