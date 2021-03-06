class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: {maximum: 20, minimum: 2}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image, destroy: false

  has_many :muscles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :muscle_comments, dependent: :destroy




# ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
   has_many :relationships, foreign_key: 'user_id'
# 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
   has_many :followings, through: :relationships, source: :follow
# フォロー上relationships

# ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
 # フォロワーされてる下reverse_of_relationships
   has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
   # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
   has_many :followers, through: :reverse_of_relationships, source: :user

   # フォローする
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
# フォロー外す
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
# フォロー確認# 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    self.followings.include?(other_user)
  end

def self.search(search)
    if search
      User.where(['name LIKE ?', "%#{search}%"])

    else
      User.all
      @user = current_user
    end
end
end
