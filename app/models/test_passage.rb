# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      current_question.answers.correct.count.zero?
    else
      current_question.answers.correct.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def success?
    result >= SUCCESS_RATIO
  end

  def result
    100 * self.correct_questions.to_d / self.test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def next_question
    test.questions.where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end

  def set_current_question
    self.current_question = next_question
  end

  def cur_question_number
    self.test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def questions_number
    self.test.questions.count
  end
end
