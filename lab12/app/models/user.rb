class User < ApplicationRecord
  validates :login, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }, presence: true

  before_save :create_hashed_password, if: :password_changed?

  def create_hashed_password
    self.password = encrypt password
  end

  def password?(submitted_password)
    self.password == encrypt(submitted_password)
  end

  def self.authenticate(login, submitted_password)
    user = find_by(login: login)
    return nil if user.nil?
    return user if user.password?(submitted_password)
  end

  private

  def encrypt(data)
    Digest::SHA2.new(256).hexdigest data
  end
end
