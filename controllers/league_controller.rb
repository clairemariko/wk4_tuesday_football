require_relative('../models/league.rb')
require_relative('../models/match.rb')
require_relative('../models/team.rb')


get '/league' do
 options = {
  'matches' => Match.all,
  'teams'=> Team.all }
@league = League.new(options)
erb(:index)
end

