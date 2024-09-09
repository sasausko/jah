require "test_helper"

class ArticlesCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get articles_categories_show_url
    assert_response :success
  end
end
