require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "should allow user signup"  do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {username: "Testuser", email: "testuser@email.com", password: "password"}}
      follow_redirect!
    end
    assert_template 'users/show'
  end
end