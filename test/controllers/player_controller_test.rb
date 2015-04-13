require 'test_helper'

class PlayerControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.build(:user)
    @user.save

    build_player('Player A', @user)
    build_player('Player B', @user)
    build_player('Player C', @user)
    build_player('Player D', @user)
  end

  def build_player(name, user)
    player = FactoryGirl.build(:player, name: name)
    user.players << player
    player.save
  end

  test 'redirect to login page when not logged in' do
    session['user_id'] = nil
    get :index

    assert_redirected_to controller: 'session', action: 'login'
  end

  test 'should work when logged in and list all players linked to current user' do
    user2 = FactoryGirl.build(:user, name: 'Someone Else')
    user2.save
    build_player('Another Player', user2)

    session['user_id'] = @user.id
    get :index

    assert_response :success
    assert_select '.player', 4
    assert_select '.player_name' do |elements|
      assert_equal 0, elements.count { |e| e.content == 'Another Player' }
    end
  end

  test 'should show an add player button' do
    session['user_id'] = @user.id
    get :index

    assert_select 'a.add_player', 1
  end

  # TODO:
  # * Should show interaction buttons (injured, what else)?
  # * Should show status icons
  #   * Position
  #   * Age
  #   * Goals ?
  #   * Assists ?
  #   * Reds
  #   * Yellows
  #  == These 2 above might be the same things
  # * Make it not look shit
end
