class SaveData < ApplicationRecord

  belongs_to :user

  enum place: { home: 0, library: 1, cafe: 2, other: 3 }

end
