json.total @total
json.current_page @current_page

json.questions do
  json.array! @questions do |question|
    json.id question.id
    json.title question.title
    json.options do
      json.array! question.options do |option|
        json.id option.id
        json.content option.content
        json.correct option.correct
      end
    end
  end
end
