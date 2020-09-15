class User < ApplicationRecord

  # ================================
  # リレーション参考文献：
  # https://qiita.com/mitsumitsu1128/items/e41e2ff37f143db81897
  # ================================

  has_many :relationships
  # followingsクラス（model）は存在しないため、through: :relationshipsとして中間テーブルを明示
  # source: :followとして、relationshipsテーブルのfollow_idを参考にして、followingsモデルにアクセスするよう明示
  has_many :followings, through: :relationships, source: :follow
  # reverse_of_relationshipsクラス（model）は存在しないため、class_name: 'Relationshipとしてrelationsipモデルの事だと明示
  # foreign_key: 'follow_id'とすることでrelaitonshipsテーブルにアクセスする時、follow_idを使うよう明示
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  # followersクラス（model）は存在しないため、through: :reverses_of_relationshipとして中間テーブルを明示
  # source: :userとして、user_idを参考にするよう明示
  has_many :followers, through: :reverse_of_relationships, source: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:[:twitter]

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end