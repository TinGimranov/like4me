module QuestionsHelper
  def get_last_questions
    @questions = Question.find(:all, :limit => 5)
    return @questions
  end
end
