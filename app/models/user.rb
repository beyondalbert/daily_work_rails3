class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :receivers, :dependent => :delete_all
  has_many :dailynotes, :dependent => :delete_all
  has_many :weeklynotes, :dependent => :delete_all

  def to
  	mail_addr_to = []
  	receivers.where(:contact_type => TO).each do |to|
  		mail_addr_to << to.email
  	end
  	mail_addr_to
  end

  def cc
  	mail_addr_cc = []
  	receivers.where(:contact_type => CC).each do |cc|
  		mail_addr_cc << cc.email
  	end
  	mail_addr_cc
  end
end
