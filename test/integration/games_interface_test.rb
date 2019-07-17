require 'test_helper'

class GamesInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:brady)
  end

  test "game interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Game.count' do
      post games_path, params: { game: { name: "", description: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    name = "Knots"
    description = "This game really ties the room together"
    assert_difference 'Game.count', 1 do
      post games_path, params: { game: { name: name, description: description } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match name, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_game = @user.games.paginate(page: 1).first
    assert_difference 'Game.count', -1 do
      delete game_path(first_game)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
