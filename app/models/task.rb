class Task < ApplicationRecord
  include AASM

  validates_length_of :description, maximum: 40
  validates_presence_of :description

  belongs_to :user

  aasm do
    state :open, initial: true
    state :in_progress, :closed

    event :start do
      transitions from: :open, to: :in_progress
    end

    event :done do
      transitions from: :in_progress, to: :closed
    end
  end
end
