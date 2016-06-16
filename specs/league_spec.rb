require( 'minitest/autorun' )
require_relative( '../models/league.rb' )
require_relative( '../models/match.rb' )
require_relative( '../models/team.rb' )

class TestLeague < Minitest::Test

def setup
  @team1 = Team.new({'name' => "Ricks team", 'id' => 1})
  @team2 = Team.new({'name' => "Vals team", 'id' => 2})
  @team3 = Team.new({'name' => "Tonys team", 'id' => 3})
  @team4 = Team.new({'name' => "Zsolts team", 'id' => 4})


  @teams = [@team1, @team2, @team3, @team4]

  @match1 = Match.new({
            'id' => 1,
            'home_team_id' => @team1.id,
            'away_team_id' => @team2.id,
            'home_team_score' => 4,
            'away_team_score' => 2
            })

  @match2 = Match.new({
      'id' => 2,
      'home_team_id' => @team3.id,
      'away_team_id' => @team4.id,
      'home_team_score' => 1,
      'away_team_score' => 6
       })
  @match3 = Match.new({
      'id' => 3,
      'home_team_id' => @team2.id,
      'away_team_id' => @team4.id,
      'home_team_score' => 2,
      'away_team_score' => 0
       })
  @match4 = Match.new({
      'id' => 4,
      'home_team_id' => @team3.id,
      'away_team_id' => @team1.id,
      'home_team_score' => 4,
      'away_team_score' => 4
       })



  @matches = [@match1, @match2, @match3, @match4]
  options = {
    'teams' => @teams,
    'matches' => @matches
  }

  @league = League.new( options )

end

  def test_list_teams()
    result = @league.list_teams()
    expectation = [ "Ricks team", "Vals team", "Tonys team", "Zsolts team" ]
    assert_equal(expectation, result)
  end

  def test_list_all_matches()  
    result= @league.list_matches
    
    assert_equal(4, result)
  end

  def test_match1_winner
  end

  def test_match1_data
    result = @league.match_data(1)
   assert_equal(@match1, result)
  end

  def test_match_who_playing
    result = @league.match_team_ids(1)
    assert_equal([1,2], result)
  end

  def test_team_name
    result = @league.match_team_names(1)
    assert_equal(["Ricks team", "Vals team"], result)
  end

  def test_matches_won
    result = @league.matches_won(@team1.id)
    assert_equal(1, result)
  end

  def test_matches_lost
    result = @league.matches_lost(@team1.id)
    assert_equal(0 , result)
  end

  def test_matches_drawn
    result = @league.matches_drawn(@team3.id)
    assert_equal(1, result)
  end



end