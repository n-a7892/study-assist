class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true

  has_many :save_datas, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  enum age: { under: 0, tens: 1, twentys: 2, thirtys: 3, fortys: 4, fiftys: 5, over: 6 }

  def self.looks(searches, words)
    age = {
      "10歳未満" => "under",
      "10代" => "tens",
      "20代" => "twentys",
      "30代" => "thirtys",
      "40代" => "fortys",
      "50代" => "fiftys",
      "60歳以上" => "over"
    }

    if searches == "name"
      @user = User.where("name LIKE ?", "%#{words}%")
    elsif searches == "content"
      @user = User.where("learning_content LIKE ?", "%#{words}%")
    elsif searches == "age"
      @user = User.where(age: age[words])
    else
      @user = User.all
    end
  end

  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  def already_favorites?(save_data)
    self.favorites.exists?(save_data_id: save_data.id)
  end
end