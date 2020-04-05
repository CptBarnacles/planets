class User < ApplicationRecord
	has_many :sponsors, dependent: :destroy
	has_many :orders, dependent: :destroy
	paginates_per 10
	validates :name,  presence: true, length:{maximum: 50 }
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 75 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }
has_secure_password
validates :password, presence: true, length: { minimum: 6}
	devise :timeoutable
end
