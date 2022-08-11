# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :user_id, presence: true
  validates :score, presence: true
  validates :registered_on, presence: true
end
