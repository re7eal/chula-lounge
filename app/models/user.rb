class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trades
  has_many :trade_messages
  
  before_create :assign_role

  def assign_role
    # assign a default role if no role is assigned
    self.add_role :student if self.roles.first.nil?
  end

end
