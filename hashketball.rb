require 'pp'
require 'pry'

def game_hash
#   { #handwritten:
#     :home=> {:team_name=> "Brooklyn Nets",
#     :colors=> ["Black", "White"],
#     :players=> [
#       {:player_name=>"Alan Anderson",:number=> 0,:shoe=>16,:points=>22,:rebounds=>12,:assists=>12,:steals=>3,:blocks=>1,:slam_dunks=>1},
#        {:player_name=>"Reggie Evans",:number=>30,:shoe=>14,:points=>12,:rebounds=>12,:assists=>12,:steals=>12,:blocks=>12,:slam_dunks=>7},
#        {:player_name=>"Brook Lopez",:number=>11,:shoe=>17,:points=>17,:rebounds=>19,:assists=>10,:steals=>3,:blocks=>1,:slam_dunks=>15},
#        {:player_name=>"Mason Plumlee",:number=>1,:shoe=>19,:points=>26,:rebounds=>11,:assists=>6,:steals=>3,:blocks=>8,:slam_dunks=>5},
#        {:player_name=>"Jason Terry",:number=>31,:shoe=>15,:points=>19,:rebounds=>2,:assists=>2,:steals=>4,:blocks=>11,:slam_dunks=>1}]},
#
#   :away=> {:team_name=> "Charlotte Hornets",
#     :colors=> ["Turquoise, Purple"],
#     :players=> [
#       {:player_name=>"Jeff Adrien",:number=>4,:shoe=>18,:points=>10,:rebounds=>1,:assists=>1,:steals=>2,:blocks=>7,:slam_dunks=>2},
#        {:player_name=>"Bismack Biyombo",:number=>0,:shoe=>16,:points=>12,:rebounds=>4,:assists=>7,:steals=>22,:blocks=>15,:slam_dunks=>10},
#        {:player_name=>"DeSagna Diop",:number=>2,:shoe=>14,:points=>24,:rebounds=>12,:assists=>12,:steals=>4,:blocks=>5,:slam_dunks=>5},
#        {:player_name=>"Ben Gordon",:number=>8,:shoe=>15,:points=>33,:rebounds=>3,:assists=>2,:steals=>1,:blocks=>1,:slam_dunks=>0},
#        {:player_name=>"Kemba Walker",:number=>33,:shoe=>15,:points=>6,:rebounds=>12,:assists=>12,:steals=>7,:blocks=>5,:slam_dunks=>12}]}
# }
{:home=>
  {:team_name=>"Brooklyn Nets",
   :colors=>["Black", "White"],
   :players=>
    [{:player_name=>"Alan Anderson",
      :number=>0,
      :shoe=>16,
      :points=>22,
      :rebounds=>12,
      :assists=>12,
      :steals=>3,
      :blocks=>1,
      :slam_dunks=>1},
     {:player_name=>"Reggie Evans",
      :number=>30,
      :shoe=>14,
      :points=>12,
      :rebounds=>12,
      :assists=>12,
      :steals=>12,
      :blocks=>12,
      :slam_dunks=>7},
     {:player_name=>"Brook Lopez",
      :number=>11,
      :shoe=>17,
      :points=>17,
      :rebounds=>19,
      :assists=>10,
      :steals=>3,
      :blocks=>1,
      :slam_dunks=>15},
     {:player_name=>"Mason Plumlee",
      :number=>1,
      :shoe=>19,
      :points=>26,
      :rebounds=>11,
      :assists=>6,
      :steals=>3,
      :blocks=>8,
      :slam_dunks=>5},
     {:player_name=>"Jason Terry",
      :number=>31,
      :shoe=>15,
      :points=>19,
      :rebounds=>2,
      :assists=>2,
      :steals=>4,
      :blocks=>11,
      :slam_dunks=>1}]},
:away=>
  {:team_name=>"Charlotte Hornets",
   :colors=>["Turquoise", "Purple"],
   :players=>
    [{:player_name=>"Jeff Adrien",
      :number=>4,
      :shoe=>18,
      :points=>10,
      :rebounds=>1,
      :assists=>1,
      :steals=>2,
      :blocks=>7,
      :slam_dunks=>2},
     {:player_name=>"Bismack Biyombo",
      :number=>0,
      :shoe=>16,
      :points=>12,
      :rebounds=>4,
      :assists=>7,
      :steals=>22,
      :blocks=>15,
      :slam_dunks=>10},
     {:player_name=>"DeSagna Diop",
      :number=>2,
      :shoe=>14,
      :points=>24,
      :rebounds=>12,
      :assists=>12,
      :steals=>4,
      :blocks=>5,
      :slam_dunks=>5},
     {:player_name=>"Ben Gordon",
      :number=>8,
      :shoe=>15,
      :points=>33,
      :rebounds=>3,
      :assists=>2,
      :steals=>1,
      :blocks=>1,
      :slam_dunks=>0},
     {:player_name=>"Kemba Walker",
      :number=>33,
      :shoe=>15,
      :points=>6,
      :rebounds=>12,
      :assists=>12,
      :steals=>7,
      :blocks=>5,
      :slam_dunks=>12}]}}
end

def all_players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_players + away_players
end

# def find_player(name)
# all_players.find do |p| p[:player_name] == name
#   end
# end
# try more implementations that use
# this method for the second go around!

def teams
game_hash.keys.reduce([]) do |memo, key|
  memo << game_hash[key]
  end
end
#p teams

 def find_teams_by_name(team_name)
   teams.find do |t| t[:team_name] == team_name
   end
 end

 def total_points(team_name)
   team_name[:players].reduce(0) do |memo, pl|
     memo + pl[:points]
  end
end

def num_points_scored(player_name)
  found_player = all_players.find do |player|
    player_name == player[:player_name]
  end
  found_player[:points]
end

def shoe_size(player_name)
  found_player = all_players.find do |player|
    player_name == player[:player_name]
  end
  found_player[:shoe]
end

def team_colors(team_name)
if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
teams.map do |team| team[:team_name]
  end
end

def player_numbers(team_name)
find_teams_by_name(team_name)[:players].reduce([]) do |memo, pl|
  memo << pl[:number]
  end
end

def player_stats(player_name)
  found_player = all_players.find do |player|
    player_name == player[:player_name]
  end
  found_player.delete(:player_name)
  found_player
end

def big_shoe_rebounds
  all_players.max_by do |p| p[:shoe]
  end [:rebounds]
end

def most_points_scored
  all_players.max_by do |p| p[:points]
  end [:player_name]
end

def winning_team
  teams.max_by do |t| total_points(t)
  end [:team_name]
end

def player_with_longest_name
  all_players.max_by do |pl| pl[:player_name].length
  end [:player_name]
end

def long_name_steals_a_ton?
player_with_longest_name == all_players.max_by do |pl| pl[:steals]
  end [:player_name]
end
#pry.start
#pp game_hash
 #Note on testing: I can run a section of tests with the following command
 # rspec spec/hashketball_spec.rb -e (method_to_test)
