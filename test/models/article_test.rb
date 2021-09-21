require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test "invalid if title is less then 4 chars" do
    user = users(:user1)
    article = user.articles.new(title: "1", text: "some text")
    article.valid?
    
    assert_not article.errors[:title].empty?
  end

  test "invalid if text is less then 4 chars" do
    user = users(:user1)
    article = user.articles.new(title: "some title", text: "")
    article.valid?
    
    assert_not article.errors[:text].empty?
  end

  test "invalid if not attached to a user" do
    article = Article.new(title: "some title", text: 'some text')
    article.valid?

    assert article.errors.has_key?(:user)
  end
  
end