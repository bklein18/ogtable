require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @user = users(:brady)
    # This code is not idiomatically correct.
    @game = @user.games.build(name: "Title", description: "Lorem Ipsum")
  end

  test "should be valid" do
    assert @game.valid?
  end

  test "user id should be present" do
    @game.user_id = nil
    assert_not @game.valid?
  end

  test "description should be present" do
    @game.description = "   "
    assert_not @game.valid?
  end

  test "content should be at most 200 characters" do
    @game.description = "a" * 201
    assert_not @game.valid?
  end

  test "order should be most recent first" do
    assert_equal games(:most_recent), Game.first
  end
end
