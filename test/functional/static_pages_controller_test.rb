require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "should get homepage" do
    get "home"
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', instructor_path, count: 2
    assert_select 'a[href=?]', admin_path, count: 2
    assert_response :success
  end

  test "should get instructor page" do
    get "instructor"
    assert_template 'static_pages/index'
    assert_equal assigns["role"], "instructor"
    assert_response :success
  end

  test "should get admin page" do
    get "admin"
    assert_template "static_pages/index"
    assert_equal assigns['role'], "admin"
    assert_response :success
  end

  test "should show correct sections" do
    get "admin"
    assert_select 'div.section-heading', {count:3, text: /\A(Pending Jobs)|(Approved Jobs)|(Awarded Jobs)\Z/}
    assert_select 'button', "Create Job"
    get "instructor"
    assert_select "div.section-heading", {count:2, text: /\A(Available Jobs)|(Awarded Jobs)\Z/}
    assert_select 'button', "Create Job"
  end

end
