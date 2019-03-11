class Item < ApplicationRecord
  belongs_to :category
  validates_presence_of :category_id, :title, :completed, :updated_at, :completed_on,
                        :created_at, :priority, :category
  validates :title, presence: true,
                    length: { minimum: 5 }
end
