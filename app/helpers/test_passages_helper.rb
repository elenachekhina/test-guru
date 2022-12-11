module TestPassagesHelper

  def cur_question_number(test_passage)
    test_passage.test.questions.order(:id).where('id < ?', @test_passage.current_question.id).count + 1
  end

  def questions_number(test_passage)
    test_passage.test.questions.count
  end

  def define_class(result)
    if result >= 85
      'correct'
    else
      'incorrect'
    end
  end

  def show_result(result)
    if result >= 85
      'Congratulations'
    else
      'Try again'
    end
  end
end
