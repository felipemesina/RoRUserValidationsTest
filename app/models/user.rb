class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, confirmation: true

  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end


end
