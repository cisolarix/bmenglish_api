class Student < User
  paginates_per 10
  before_validation :populate_password

  has_many :practices, class_name: 'Practices::Result', foreign_key: 'user_id'

  private

  def populate_password
    return if password.present?
    self.password = '123456'
    self.password_confirmation = '123456'
  end
end
