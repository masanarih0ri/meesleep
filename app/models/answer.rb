# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :log
  belongs_to :question

  validates :question_id, presence: true
  validates :is_good_habit, inclusion: { in: [true, false] }
  validates :log_id, uniqueness: { scope: :question_id }
end
