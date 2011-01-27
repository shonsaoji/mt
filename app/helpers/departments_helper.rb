module DepartmentsHelper
  def hospital_admin?(hospital_id)
    user_has_hospital_admin_rights? (hospital_id) 
  end
end
