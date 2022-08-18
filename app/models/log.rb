# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  accepts_nested_attributes_for :answers, allow_destroy: true

  before_validation :fill_score

  validates :user_id, presence: true
  validates :registered_on, presence: true

  def fill_score
    self.score = ((answers.select(&:is_good_habit).size.to_f / answers.size) * 100).round(0)
  end
end
