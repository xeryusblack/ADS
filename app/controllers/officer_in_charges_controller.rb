class OfficerInChargesController < ApplicationController
    skip_authorization_check
  def index
    @officer_in_charges = OfficerInCharge.all

    render(:template => "officer_in_charges/index")
  end

  def make

  redirect_to destroy_officer_in_charge_session_path
  if !officer_in_charge_signed_in?
    redirect_to new_officer_in_charge_registration_path
    #render(:template => "/debate")
  end

  end

  def destroy
    @officer_in_charge = OfficerInCharge.find(params[:id])
    #officer_in_charge.destroy!
    OfficerInCharge.where(:id => @officer_in_charge.id).destroy_all
    redirect_to officer_in_charges_path
  end

  def officer_in_charge_params
    params.require(:officer_in_charge).permit( {:role_ids => []})
  end
end
