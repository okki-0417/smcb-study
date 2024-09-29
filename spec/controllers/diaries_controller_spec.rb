# frozen_string_literal: true

require "rails_helper"

RSpec.describe DiariesController, type: :controller do
  let(:current_user) { create(:user) }

  describe "index" do
    subject { get :index }
    it "レスポンス200が返ること" do
      expect(subject).to be_successful
    end
  end

  describe "new" do
    subject { get :new }
    context "未ログインの場合" do
      it_behaves_like :reject_not_logged_in_user
    end

    context "ログイン済みの場合" do
      before { controller.login(current_user) }
      it "レスポンス200が返ること" do
        expect(subject).to be_successful
      end
    end
  end

  describe "create" do
    subject { post :create, params: {
      diary: {
        title: "test_title",
        okazu_title: "test_okazu_title",
        creator_user_id: current_user.id,
        content: "test_content",
        reputation_points: 100
      }
    }}

    context "未ログインの場合" do
      it_behaves_like :reject_not_logged_in_user
    end

    context "ログイン済みの場合" do
      before { controller.login(current_user) }
      it "正常に日記を作成できること" do
        expect { subject }.to change(Diary, :count).by(1)
      end
    end
  end
end
