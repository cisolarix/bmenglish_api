DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

u = Student.find_or_initialize_by(cell: '15270853389')
u.name = '雁鸣'
u.password = 'yuyouleon'
u.save

t = Teacher.find_or_initialize_by(cell: '18970013155')
t.name = '吴老师'
t.password = 'yuyouleon'
t.super = true
t.save

100.times do
  q = Question.create(
    title: Faker::Lorem.sentence,
    options_attributes: [
      { content: Faker::Lorem.words(4).join(' '), correct: [true, false].sample },
      { content: Faker::Lorem.words(4).join(' '), correct: [true, false].sample },
      { content: Faker::Lorem.words(4).join(' '), correct: [true, false].sample },
      { content: Faker::Lorem.words(4).join(' '), correct: [true, false].sample }
    ]
  )
end

book = Chapter.create title: '英语-人教版七年级下'
unit_1 = book.children.create title: 'Unit 1 Can you play the guitar?'
unit_1.children.create title: '定冠词'
unit_1.children.create title: '零冠词'
unit_1.children.create title: 'can 表"能力"'
unit_1.children.create title: '复习检测'

unit_2 = book.children.create title: 'Unit 2 What time do you go to school?'
unit_2.children.create title: '时间介词'
unit_2.children.create title: '时间表达法'
unit_2.children.create title: '复习检测'
