class SaveData < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :day, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :place, presence: true
  validates :content, presence: true

  enum place: { home: 0, library: 1, cafe: 2, other: 3 }

  def self.looks(searches, words)
    place = {
      "自宅" => "home",
      "図書館" => "library",
      "カフェ" => "cafe",
    }

    if searches == "place"
      @save_data = SaveData.where(place: place[words])
    elsif searches == "other_place"
      @save_data = SaveData.where("other_place LIKE ?", "%#{words}%")
    elsif searches == "content"
      @save_data = SaveData.where("content LIKE ?", "%#{words}%")
    else
      @save_data = SaveData.all
    end
  end

end
