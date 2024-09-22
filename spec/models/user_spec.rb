# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    let(:form_params) do
      {
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
  end
end
