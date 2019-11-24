class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, :confirmable,
         :lockable, :timeoutable,
         :trackable
  has_many :blog_posts
  has_many :comments
end
