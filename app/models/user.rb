class User < ApplicationRecord
  has_secure_password validations: false

  has_many :workbooks

  def added_textbook?(textbook_id: nil)
    return if textbook_id.blank?
    workbook_ids.include? textbook_id.to_i
  end
end
