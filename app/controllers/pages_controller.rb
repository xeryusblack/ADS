class PagesController < ApplicationController
	skip_authorization_check
  def index
  	if officer_in_charge_signed_in?

    else
		redirect_to new_officer_in_charge_session_path
	end
  end
end
