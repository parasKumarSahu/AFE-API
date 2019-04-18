class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :api_name, type: String
  field :plan, type: String
  field :email, type: String
  field :password_digest, type: String
  has_secure_password
end
