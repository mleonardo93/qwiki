class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  has_many :collaborators
  enum role: [:user, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def downgrade
    self.user!
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
