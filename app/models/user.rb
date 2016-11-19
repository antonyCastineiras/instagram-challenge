class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :followings, class_name: "Following",
  											foreign_key: "follower_id",
  											dependent: :destroy
  

  def currently_following
  	user_ids = self.followings.map(&:id)
  	User.where(id: user_ids)
  end

  def suggested_to_follow
  	(User.all - currently_following - [self]).sample(3)
  end
end
