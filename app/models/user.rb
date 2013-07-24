#encoding: UTF-8
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  
  attr_accessible :email, :password, :password_confirmation, :role

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  
  module Role
    ADMIN = 'Administrador'
    SECRETARY = 'Secretária'
    OFFICE = 'Escritório'
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
