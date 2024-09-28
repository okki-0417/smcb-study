# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe "new" do
    subject { get :new }

    context "ログイン済みの時" do
      before { controller.login(user) }
      it "マイページにリダイレクトすること" do
        subject
        expect(response).to redirect_to(mypage_path)
      end
    end

    context "未ログインの時" do
      it "レスポンス200が返ること" do
        subject
        expect(response).to be_successful
      end
    end
  end

  describe "create" do
    subject { post :create, params: {
      user: {
        name: "test_user",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      }
    }}
    context "ログイン済みの時" do
      before { controller.login(user) }
      it "マイページにリダイレクトすること" do
        subject
        expect(response).to redirect_to(mypage_path)
      end
    end

    context "未ログインの時" do
      it "正しくユーザーが作成されること" do
        expect { subject }.to change { User.count }.by(1)
        expect(response).to redirect_to mypage_path
      end
    end
  end
end
