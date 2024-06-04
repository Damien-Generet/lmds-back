class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
	:jwt_authenticatable,
	jwt_revocation_strategy: JwtDenylist

  has_many :events, foreign_key: 'creator_id', dependent: :destroy
  validates :password, presence: true, length: { minimum: 6 }, on: :create

end
