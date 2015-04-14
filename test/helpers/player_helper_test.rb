require 'test_helper'

class PlayerHelperTest < ActionView::TestCase
  include PlayerHelper

  test 'should have the full list of positions and abbreviations' do
    assert_position 'Goalkeeper', 'GK'
    assert_position 'Sweeper', 'SW'
    assert_position 'Right Back', 'RB'
    assert_position 'Right Wingback', 'RWB'
    assert_position 'Centre Back', 'CB'
    assert_position 'Left Back', 'LB'
    assert_position 'Left Wingback', 'LWB'
    assert_position 'Centre Defensive Midfield', 'CDM'
    assert_position 'Right Midfield', 'RM'
    assert_position 'Centre Midfield', 'CM'
    assert_position 'Left Midfield', 'LM'
    assert_position 'Right Wing', 'RW'
    assert_position 'Centre Attacking Midfield', 'CAM'
    assert_position 'Left Wing', 'LW'
    assert_position 'Striker', 'ST'
  end

  def assert_position(position, abbreviation)
    assert position_list.include?([position, abbreviation]), "Expected to #{position} to exist with abbreviation #{abbreviation}"
  end

end
