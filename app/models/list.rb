class List < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { maximum: 200 }
end
