# frozen_string_literal: true

require 'rails_helper'

describe Log, type: :model do
  describe '#fill_score' do
    subject { log.fill_score }
    let(:user) { create(:user) }
    let(:log) { build(:log, user:, score: nil) }
    let!(:answer1) { log.answers.build(question: question1, is_good_habit: true) }
    let!(:answer2) { log.answers.build(question: question2, is_good_habit: false) }
    let(:question1) { create(:question) }
    let(:question2) { create(:question, content: '質問2') }

    subject { log.fill_score }

    it 'should sets score column' do
      subject
      expect(log.score).to eq 50
    end
  end
end
