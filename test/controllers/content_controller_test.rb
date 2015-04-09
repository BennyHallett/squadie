require 'test_helper'

class ContentControllerTest < ActionController::TestCase

  test 'user details and logout shows when logged in' do
    session['user_id'] = 1
    get :landing

    assert_select '#nav-user-details', 1
    assert_select '#nav-logout', 1
    assert_select '.social-login', 0
  end

  test 'user details and logout does not show when logged in' do
    session['user_id'] = nil
    get :landing

    assert_select '#nav-user-details', 0
    assert_select '#nav-logout', 0
    assert_select '.social-login', 3
  end

  test 'user bar exists when logged in' do
    session['user_id'] = 1
    get :landing

    assert_select '.user-bar', 1
  end

  test 'user bar doesnt exist when not logged in' do
    session['user_id'] = nil
    get :landing

    assert_select '.user-bar', 0
  end
end
