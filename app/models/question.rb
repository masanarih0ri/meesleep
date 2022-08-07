# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  has_many :logs, through: :answers

  validates :content, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
