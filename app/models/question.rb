# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  has_many :logs, through: :answers
end
