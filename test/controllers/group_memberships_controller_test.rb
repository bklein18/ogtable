require 'test_helper'

class GroupMembershipsControllerTest < ActionDispatch::IntegrationTest
  test "create should require logged-in user" do
    assert_no_difference 'GroupMembership.count' do
      post group_membership_path
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'GroupMembership.count' do
      membership = group_memberships(:one)
      delete group_membership_path(membership)
    end
    assert_redirected_to login_url
  end
end
