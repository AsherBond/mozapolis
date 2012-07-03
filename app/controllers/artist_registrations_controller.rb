class ArtistRegistrationsController < Devise::RegistrationsController
  def edit
    @artist = current_artist

  end

  def update
    if current_artist.update_without_password(params[:artist])
      # Sign in the user bypassing validation in case his password changed
      sign_in current_artist, :bypass => true
      flash[:notice] = "Successfully updated account."
      redirect_to current_artist
    else
      render "edit"
    end
  end

end