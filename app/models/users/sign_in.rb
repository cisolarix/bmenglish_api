class Users::SignIn < ActiveType::Object
  attribute :cell
  attribute :password
  attribute :logged_user

  validates :cell, presence: true
  validates :password, presence: true
  validate :try_to_login

  after_save :persist

  private

  def persist
    self.logged_user = user
  end

  def try_to_login
    errors.add :base, :user_not_exist unless user
    errors.add :base, :cell_password_error unless user && user.authenticate(password)
  end

  def user
    @user ||= User.find_by cell: cell
  end
end
