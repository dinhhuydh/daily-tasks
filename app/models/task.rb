class Task < ApplicationRecord
  validates_length_of :description, maximum: 40
  validates_presence_of :description

  belongs_to :user
end
