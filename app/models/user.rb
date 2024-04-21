class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
    validates :last_name, :first_name, presence: true
    validates :password, confirmation: true
end
