def game_hash
  
  game_hash = {
    
    :home => { 
      
      
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
        
{player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
{player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12 , slam_dunks: 7},
{player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19 , assists: 10 , steals: 3, blocks: 1, slam_dunks: 15},
{player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks:8 , slam_dunks:  5},
{player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks:  1}
]
},
    :away => { 
      
      
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => [
        
{player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1 , steals: 2, blocks: 7 , slam_dunks: 2},
{player_name: 'Bismack Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
{player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
{player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
{player_name: 'Kemba Walker', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
]
    }
  }
end 


def long_name_steals_a_ton?
  longest_name = player_with_longest_name

  player_name_steals_high = ""
  
  steals_high = 0 

  game_hash.map {|team, team_information| 
    team_information.map{|sing, sing_data|
      if sing == :players 
        sing_data.each {|player_hash|
          if player_hash[:steals] > steals_high
            steals_high = player_hash[:steals]
            player_name_steals_high = player_hash[:player_name]
          end
        }
      end 
    }
  }
  longest_name == player_name_steals_high
end 

def player_with_longest_name 
  longest_name = "" 

  game_hash.map {|team, team_information|
    team_information.map {|sing, sing_data|
      if sing == :players 
        sing_data.each {|player_hash|
          if player_hash[:player_name].length > longest_name.length 
            longest_name = player_hash[:player_name] 
          end 
        }
      end 
    }
  }
  longest_name
end 


def winning_team
  home_points = 0 
  away_points = 0 

  game_hash.map {|team, team_information|

    if team == :home 
      team_information[:players].each {|player_hash|
        home_points += player_hash[:points]
      }
    else
      team_information[:players].each {|player_hash| 
        away_points += player_hash[:points] 
      }
    end 

    if home_points > away_points
      return game_hash[:home][:team_name]
    else 
      return game_hash[:away][:team_name]
    end 
  }

end 


def most_points_scored
  player_name = ""
  most_points = 0 

  game_hash.map {|team, team_information| 
    team_information.map{|sing, sing_data|
      if sing == :players 
        sing_data.each {|player_hash|
          if player_hash[:points] > most_points
            most_points = player_hash[:points]
            player_name = player_hash[:player_name]
          end
        }
      end 
    }
  }
  player_name
end 


def num_points_scored(player_name)
  points_scored = 0 

  game_hash.map {|team, team_information|
  
    team_information.map {|team_sings, data|
    
      if team_sings == :players
        data.select {|player_array|
          if player_array[:player_name] == player_name
            points_scored += player_array[:points] 
          end 
        }
      end 
    }
  }

  points_scored 
end 


def shoe_size(player_name)
  game_hash.map {|team, team_information|
    team_information.map {|team_sings, data|
      if team_sings == :players
        data.select {|player_array|
          if player_array[:player_name] == player_name
            return player_array[:shoe] 
          end 
        }
      end 
    }
  }
end 

def team_colors(team_name)
  game_hash.map {|team, team_information|
    if team_information[:team_name] == team_name
      return team_information[:colors]
    end 
  }
end 


def team_names
  team_names = []

  game_hash.map {|team, team_information|
    team_names.push(team_information[:team_name])
  }

  team_names
end 


def player_numbers(team_name)
  num_array = []

  game_hash.map {|team, team_information|
    if team_information[:team_name] == team_name
      team_information[:players].select {|player_hash|
        num_array << player_hash[:number]
      }
    end 
  }

  num_array

end 

def player_stats(player_name)
  player_stats = {}

  game_hash.map {|team, team_information|
    team_information.map {|sing, data|
      if sing == :players 
        data.map {|player_hash|
          if player_hash[:player_name] == player_name
            player_stats = player_hash
          end 
        }
      end 
    }
  }

  player_stats.delete(:player_name)
  player_stats
end 


def big_shoe_rebounds
  rebounds = 0 
  shoe_size = 0

  game_hash.map {|team, team_information|


    team_information.map {|sing, data|
      if sing == :players 
        data.map {|player_stats|
          if shoe_size < player_stats[:shoe]
            shoe_size = player_stats[:shoe]
            rebounds = player_stats[:rebounds]
          end 
        }
      end
     }
  }
  rebounds 
end 