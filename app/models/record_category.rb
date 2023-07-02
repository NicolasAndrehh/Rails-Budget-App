class RecordCategory < ApplicationRecord
  belongs_to :record
  belongs_to :category

  validates :record_id, presence: true
  validates :category_id, presence: true
end
