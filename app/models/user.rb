class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #新規登録時のバリデーション
  validates :name, presence: true
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /\A[a-z0-9]+\z/i

    errors.add :password, 'は不正な値です'
  end
  
end
