class League

  attr_reader( :teams, :matches)

   def initialize(options)
    @teams = options ['teams']
    @matches = options ['matches']
   end

   def list_teams
    return @teams.map{ | team | team.name }
   end

   def list_matches
    return @matches.count
   end

   def match_data(id)
      @matches.each do |match | 
       if match.id == id
          return match
        end
      end
    end

    def match_team_ids(id) #REFACTOR, pass options instead?
       match = match_data(id)
       home_id = match.home_team_id
       away_id = match.away_team_id
       return team = [home_id, away_id]
     end

     def match_team_names(id)
      team_names =[]
      team_ids = match_team_ids(id)
      team_ids.each do | id |
        for team in @teams 
          if id == team.id
            team_names << team.name
          end
        end
      end
      return team_names
     end

     def matches_won(team_id)
      winning_matches = @matches.select { | match | match.home_team_id == team_id && match.home_team_score > match.away_team_score || match.away_team_id == team_id && match.away_team_score > match.home_team_score}

        return winning_matches.length
    end

    def matches_lost(team_id)
        losing_matches = @matches.select { | match | match.home_team_id == team_id && match.home_team_score < match.away_team_score || match.away_team_id == team_id && match.away_team_score < match.home_team_score}

          return losing_matches.length
      end

    def matches_drawn(team_id)
        drawn_matches = @matches.select { | match | match.home_team_id == team_id && match.home_team_score == match.away_team_score || match.away_team_id == team_id && match.away_team_score == match.home_team_score}

          return drawn_matches.length
      end


end