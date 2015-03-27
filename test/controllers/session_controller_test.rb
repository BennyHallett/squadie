require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "log in with twitter" do
    @twitter_hash = TestHelper::Hashes.twitter_auth_hash
    @controller.expects(:auth_hash).returns(@twitter_hash)
    get :create, provider: 'twitter'

    assert_redirected_to controller: 'content', action: 'landing'
    user = assigns(:user)
    assert user

    assert_equal @twitter_hash[:provider], user.oauth_provider
    assert_equal @twitter_hash[:uid], user.oauth_uid
    assert_equal @twitter_hash[:name], user.name
    assert_equal @twitter_hash[:image], user.avatar_url
  end

  test "log out" do
    session['user_id'] = 1
    get :destroy

    assert_equal nil, session['user_id']
    assert_redirected_to controller: 'content', action: 'landing'
  end
end
