class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password

  has_many :stories, dependent: :destroy

  before_save { |user| user.email = email.downcase }

  validates_presence_of :name, on: :create
  validates_uniqueness_of :name, on: :create
  validates_presence_of :email, on: :create
  validates_uniqueness_of :email, on: :create
  validates_presence_of :password, on: :create
end
