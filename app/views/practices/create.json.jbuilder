if @practice.errors.blank?
  json.result @practice.result
else
  json.errors @practice.errors.messages
  json.result 1
end
