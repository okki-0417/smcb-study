# frozen_string_literal: true

require "rails_helper"

RSpec.describe LoginSessionsController, type: :controller do
  let(:user) { create(:user) }
  describe "create" do
    context "正しいemailとパスワードの時" do
      subject { post :create, params: {
          login_form: {
            email: user.email,
            password: "#{user.password}"
          }
        }
      }
      it "正しくログインできること" do
        subject
        expect(controller.logged_in?).to eq(true)
        expect(response).to redirect_to(mypage_path)
      end
    end

    context "不正なemilやパスワードの時" do
      it "ログインできないこと" do
        post :create, params: {
          login_form: {
            email: "invalid@invalid.com",
            passpword: "#{user.password}"
          }
        }
        expect(controller.logged_in?).to eq(false)
        expect(response).to render_template(:new)

        post :create, params: {
          login_form: {
            email: user.email,
            passpword: "invalid_password"
          }
        }
        expect(controller.logged_in?).to eq(false)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "destroy" do
    subject { delete :destroy }
    it "正しくログアウトされること" do
      post :create, params: {
        login_form: {
          email: user.email,
          password: "#{user.password}"
        }
      }
      expect(controller.logged_in?).to eq true
      subject
      expect(controller.logged_in?).to eq false
      expect(response).to redirect_to root_path
    end
  end
end
