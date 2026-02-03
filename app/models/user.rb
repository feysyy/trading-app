class User < ApplicationRecord
  has_many :stocks
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  after_update_commit :send_verified_email, if: :saved_change_to_verified?

  # def self.verified_users
  #   where(role: false, verified: true)
  # end

  # def self.unverified_users
  #   where(role: false, verified: false)
  # end


  #
  def self.users_status
    users = where(role: false)

    {
      verified: users.where(verified: true),
      unverified: users.where(verified: false)
    }
  end

  def status
    self.verified? ? "Verified" : "Pending"
  end

  def add_balance
  end

  private

  def send_verified_email
    verified ? UserMailer.verified_email(self).deliver_later : UserMailer.unverified_email(self).deliver_later
  end
end
