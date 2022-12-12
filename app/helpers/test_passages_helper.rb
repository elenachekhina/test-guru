module TestPassagesHelper

  CSS_CLASS_DICT = {
    true => 'correct',
    false => 'incorrect'
  }.freeze

  CONCLUSION_DICT = {
    true => 'Congratulations',
    false => 'Try again'
  }.freeze

  DICT_NAME = {
    css_class: CSS_CLASS_DICT,
    conclusion: CONCLUSION_DICT
  }.freeze

  def options(success, option)
    DICT_NAME[option][success]
  end

end
