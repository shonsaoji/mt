class Account < ActiveRecord::Base
  has_many :users

  # Account Type
  MED_TOUR = 0,
  HOSPITAL = 1,
  DOCTOR = 2,
  TRAVEL_AGENT = 3,
  PATIENT =4

  def account_admin
    self.users.find(:first, :conditions=> ['admin = 2'])
  end

end
