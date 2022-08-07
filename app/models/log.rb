# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  validates :user_id, presence: true
  validates :score, presence: true
  validates :registerd_on, presence: true
end
