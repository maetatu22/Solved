class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :problems
  has_many :comments
  belongs_to_active_hash :gender

  validates :name, presence: true
  validates :self_introduction, length: { maximum: 160 }
  validates :password ,format:  { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: "Password Include both letters and numbers"}
end
