require 'digest/md5'

class Ranter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rants

  def gravatar_url
    hash = Digest::MD5.hexdigest(email.downcase)
    image_src = "https://www.gravatar.com/avatar/#{hash}"
  end
end
