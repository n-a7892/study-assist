class PostTag < ApplicationRecord

  belongs_to :posts
  belongs_to :tag

end
