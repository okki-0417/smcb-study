# froze_string_literal: true

require 'rails_helper'

RSpec.describe Diary, type: :model do
  let(:form_params) { {
    title: "test_diary_title",
    okazu_title: "test_okazu_title",
    reputation_points: "100",
    content: "test_content"
  }}
  describe "validation" do
    subject { described_class.new(form_params) }

    it "正しくバリデーションされること" do
      expect(subject).to be_valid
    end
  end
end
