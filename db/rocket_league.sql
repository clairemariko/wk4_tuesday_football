CREATE TABLE teams (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE matches (
  id serial4 primary key,
  home_team_id int4 references teams(id),
  away_team_id int4 references teams(id),
  home_team_score int4,
  away_team_score int4
);

CREATE TABLE league(
  id serial4 primary key,
  team_id int4 REFERENCES teams(id),
  match_id int4 REFERENCES matches(id),
  no_of_wins int4,
  no_of_losses int4,
  no_of_draws int4,
  no_of_goals int4,
  no_of_games_played int4
);