RSpec.shared_examples :reject_not_logged_in_user do
  it "会員登録画面にリダイレクトされること" do
    expect(subject).to redirect_to new_user_path
  end
end
