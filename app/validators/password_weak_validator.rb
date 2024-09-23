# frozen_string_literal: true

class PasswordWeakValidator < ActiveModel::EachValidator
  MIN_LENGTH = 5
  MAX_LENGTH = 20

  def validate_each(record, attribute, _value)
    record.validates_length_of(
      attribute,
      minimum: MIN_LENGTH,
      maximum: MAX_LENGTH,
    )
  end
end
