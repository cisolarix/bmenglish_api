if @practice.errors.blank?
  json.result @practice.result
else
  json.result 1
end
