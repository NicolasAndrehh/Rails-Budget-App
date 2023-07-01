class Category < ApplicationRecord
    belongs_to :user
    has_many :record_categories, dependent: :destroy
    has_many :records, through: :record_categories

    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates :author_id, presence: true
end
