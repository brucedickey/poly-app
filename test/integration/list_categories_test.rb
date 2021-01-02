# frozen_string_literal: true

require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get blog_categories_path
    assert_template "categories/index"
    # Check each category title for being a link and having the correct text.
    assert_select "a[href=?]", blog_category_path(@category), text: @category.name
    assert_select "a[href=?]", blog_category_path(@category2), text: @category2.name
  end
end
