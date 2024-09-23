# frozen_string_literal: true

class BaseForm
  include ActiveModel::Model

  ERROR_MESSAGE_GENERAL = "※ 入力項目に不備があります、ご確認下さい。"

    def initialize(params = {})
    fixed_params = {}
    params.each do |key, value|
      fixed_params[key] = value
      # fixed_params[key] = if value.is_a?(String)
      #                       StringUtil.normalize_new_line(value)
      # else
      #                       value
      # end
    end

    super(fixed_params)
    # super(params)
  end
end
