require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username:"test", email:"test@example.com", password:"password")
    @category = Category.create(name: "test")
  end

  test "should allow article creation"  do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "Test title", description: "this is my test description", category_ids: [1]}}
      follow_redirect!
    end
    assert_template 'articles/show'
  end
end