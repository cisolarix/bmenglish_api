DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

u = User.find_or_initialize_by(cell: '15270853389')
u.password = '000'
u.name = '雁鸣'
u.save

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

Faker::Lorem.words(10).uniq.each do |word|
  Tag.create name: word
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
