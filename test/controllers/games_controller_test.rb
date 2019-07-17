require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @game = games(:bird)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Game.count' do
      post games_path, params: { games: { name: "Lorem ipsum", description: "dolor sit amet" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Game.count' do
      delete game_path(@game)
    end
    assert_redirected_to login_url
  end


  test "should redirect destroy for wrong game" do
    log_in_as(users(:brady))
    game = games(:ants)
    assert_no_difference 'Game.count' do
      delete game_path(game)
    end
    assert_redirected_to root_url
  end

end
