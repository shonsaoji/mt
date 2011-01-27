# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_has_hospital_admin_rights? (hospital_id)
    if current_user.admin == User::SUPER
      return true
    elsif current_user.id == Hospital.find(hospital_id).user_id and current_user.account.account_type == Account::HOSPITAL and ( current_user.admin == User::ACCOUNT_ADMIN or current_user.admin == User::ADMIN)
      return true
    else
      return false
    end    
  end

end
