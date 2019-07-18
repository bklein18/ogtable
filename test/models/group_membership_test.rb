require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase

  def setup
    @membership = GroupMembership.new(user_id: users(:brady).id, group_id: groups(:trulia).id)
  end

  test "should be valid" do
    assert @membership.valid?
  end

  test "should require a user_id" do
    @membership.user_id = nil
    assert_not @membership.valid?
  end

  test "should require a group_id" do
    @membership.group_id = nil
    assert_not @membership.valid?
  end
end
