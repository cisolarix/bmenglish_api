class Practice < ActiveType::Object
  attribute :choices, default: proc { [] }
  attribute :user
  attribute :workbook_id
  attribute :lesson_id
  attribute :result

  validates :choices, presence: true
  validates :user, presence: true
  validates :workbook_id, presence: true
  validates :lesson_id, presence: true

  after_save :persist!

  private

  def persist!
    results = []
    choices.each do |choice|
      question = Question.find(choice['questionId'])

      results << {
        question: question,
        choices: choice['optionId'],
        correct: question.correct_answers_ids.sort == choice['optionId'].sort
      }
    end

    score =
      begin
        total = results.count
        correct = results.select { |r| r[:correct] }.count
        (correct / total.to_f * 100).ceil
      end

    if score >= 90 && next_lesson.present?
      workbook.update! visible_lessons: workbook.visible_lessons.push(next_lesson.id).uniq
    end

    practice_result = Practices::Result.create(
      user: user,
      workbook_id: workbook_id,
      lesson_id: lesson_id,
      score: score,
      questions_attributes: results
    )

    self.result = {
      id: practice_result.id,
      score: score,
      total: choices.count,
      correct: results.select { |r| r[:correct] }.count
    }
  end

  def workbook
    @workbook ||= Workbook.find workbook_id
  end

  def lesson
    @lesson = Lesson.find lesson_id
  end

  def next_lesson
    @next_lesson = lesson.next
  end
end
