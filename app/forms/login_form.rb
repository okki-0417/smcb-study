# frozen_string_literal: true

class LoginForm < BaseForm
  attr_accessor :email
  attr_accessor :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, "email": true
  validates :password, "password_weak": true
end
