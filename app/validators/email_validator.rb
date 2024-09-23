# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  MAX_LENGTH           = 256
  VALID_EMAIL_FORMAT   = %r(\A[\w._ \-?+/]+@[\w.-]+\.\w{2,}\z)
  ERROR_MESSAGE_LENGTH = "利用可能なメールアドレスは最大#{MAX_LENGTH}文字です。".freeze
  ERROR_MESSAGE_FORMAT = "example@example.comの形式でご入力ください。"

  def validate_each(record, attribute, value)
    return unless record.errors.empty?

    record.errors.add(attribute, ERROR_MESSAGE_LENGTH) if value.length > MAX_LENGTH
    record.errors.add(attribute, ERROR_MESSAGE_FORMAT) unless value =~ VALID_EMAIL_FORMAT
  end
end
