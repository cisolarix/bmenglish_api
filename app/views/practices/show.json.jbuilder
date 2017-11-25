json.questions do
  json.array! @questions do |question|
    json.id question.id
    json.title question.title
    json.options do
      json.array! question.options.shuffle do |option|
        json.id option.id
        json.content option.content
      end
    end
  end
end
