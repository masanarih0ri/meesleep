# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :log
  belongs_to :question
end
