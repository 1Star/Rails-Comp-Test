class User < ActiveRecord::Base
  has_many :tours

  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/,
                              message: 'please input valid email address'}
  validates :invitation_token, :invitation_at, presence: true, on: :create
  validates :first_name, :last_name, :phone, presence: true, on: :update

  def name
    first_name + ' ' + last_name
  end
end
