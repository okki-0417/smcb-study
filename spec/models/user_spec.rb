# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    let(:form_params) do {
        name: "test",
        email: "test@example.com",
        password: "foobar",
        password_confirmation: "foobar"
      }
    end

    subject { described_class.new(form_params) }

    it "バリデーションが通ること" do
      expect(subject).to be_valid
    end

    it "不正なemailでは通らないこと" do
      form_params[:email] = "invalid email"
      expect(described_class.new(form_params)).to be_invalid
    end

    it "不正なpasswordでは通らないこと" do
      form_params[:password] = "a" * 4
      form_params[:password_confirmation] = form_params[:password]
      expect(described_class.new(form_params)).to be_invalid
    end
  end
end
