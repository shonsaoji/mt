class Hospital < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :departments

  def get_admin
    User.find(self.user_id)
  end
  
  def get_all_procedures
    procedures = []
    departments = self.departments
    departments.each do |department|
      procedures.concat(department.medical_procedures)
    end
    procedures.sort {|a,b| a.name.downcase <=> b.name.downcase}
  end
end

