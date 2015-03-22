module ApplicationHelper
	def resource_class 
		OfficerInCharge
	end
	def resource_name
    :officer_in_charge
  end

  def resource
    @resource ||= OfficerInCharge.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:officer_in_charge]
  end
end
