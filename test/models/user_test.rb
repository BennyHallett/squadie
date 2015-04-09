require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @twitter_hash = TestHelper::Hashes.twitter_auth_hash
  end

  test "create user if it doesn't exist from twitter hash" do
    assert_equal 2, User.count # There are 2 in the fixtures

    user = User.find_or_create(@twitter_hash)

    assert_equal @twitter_hash[:provider], user.oauth_provider
    assert_equal @twitter_hash[:uid], user.oauth_uid
    assert_equal @twitter_hash[:info][:name], user.name
    assert_equal @twitter_hash[:info][:image], user.avatar_url

    assert_equal 3, User.count
  end

  test "return user if they do exist from twitter hash" do
    User.find_or_create(@twitter_hash)
    assert_equal 3, User.count

    user = User.find_or_create(@twitter_hash)
    assert_equal @twitter_hash[:provider], user.oauth_provider
    assert_equal @twitter_hash[:uid], user.oauth_uid
    assert_equal @twitter_hash[:info][:name], user.name
    assert_equal @twitter_hash[:info][:image], user.avatar_url

    assert_equal 3, User.count
  end

end
