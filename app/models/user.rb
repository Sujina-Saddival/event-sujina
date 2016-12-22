class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation
  has_many :invitations, foreign_key: :invitee_id
  has_many :events, through: :invitations
  attr_accessor :password
  before_save :encrypt_password
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :username

  mount_uploader :image,ImageUploader

  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_length_of :password, minimum: 6
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z]+\.)+[a-z]{2,})\z/i
  
  def self.create_with_omniauth(auth) 
    binding.pry
    create! do |user|                  
    user.provider = auth["provider"]    
    user.uid = auth.uid                 
    user.name = auth.info.name         
    user.save!                     
    end                  
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
