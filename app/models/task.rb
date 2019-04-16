class Task < ApplicationRecord
validates :title,
  presence: true,
  length: {maximum: 50}
validates :user_id, presence: true
has_many :favorites
belongs_to :user
end
