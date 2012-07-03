class FanRegistrationsController < Devise::RegistrationsController
  def edit
    @fan = current_fan

  end

  def update
    if current_fan.update_without_password(params[:fan])
      # Sign in the user bypassing validation in case his password changed
      sign_in current_fan, :bypass => true
      flash[:notice] = "Successfully updated account."
      redirect_to current_fan
    else
      render "edit"
    end
  end

end