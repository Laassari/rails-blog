require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
    @article = @user.articles.create! title: "test article", text: "some content"
  end

  test "it fetch all article" do
    get articles_path

    assert_response :success
  end

  test "it fetches a single article" do
    get article_path(@article.id)

    assert_response :success
    assert_select 'h1', @article.title
  end

  test "it deletes an article" do
    assert_difference('Article.count', -1) do
      delete article_path(@article.id)

      follow_redirect!
    end
  end
end