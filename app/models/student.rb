class Student < User
  before_validation :populate_password

  private

  def populate_password
    self.password = '123456'
    self.password_confirmation = '123456'
  end
end
