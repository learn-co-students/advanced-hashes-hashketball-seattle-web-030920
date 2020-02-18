def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end

def num_points_scored(player_search)
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == player_search
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_input)
  if team_input.downcase == "charlotte hornets" 
    return game_hash[:away][:colors]
  else return game_hash[:home][:colors]
  end
end

def team_names
  team_names = []
  game_hash.each do |team, team_info|
    team_names << team_info[:team_name]
  end
  team_names
end 

def player_numbers(team_name)
  jersey_numbers = []
  if team_name.downcase == "charlotte hornets" 
    game_hash[:away][:players].each do |player|
      jersey_numbers << player[:number]
    end
  else 
    game_hash[:home][:players].each do |player|
    jersey_numbers << player[:number]
    end
  end
  jersey_numbers
end   

def player_stats(player_name)
  game_hash.each do |team, info|
    info[:players].each do |player|
      if player[:player_name] == player_name
        player.delete(:player_name)
        return player
      end 
    end
  end 
end 

def big_shoe_rebounds 
  largest_shoe_size = 0
  rebounds = 0
  game_hash.each do |team, info|
    info[:players].each do |player|
      if player[:shoe] > largest_shoe_size
        largest_shoe_size = player[:shoe]
        rebounds = player[:rebounds]
      end 
    end
  end
  rebounds
end 

def most_points_scored
  most_points = 0 
  player_name = ""
  game_hash.each do |team, info|
    info[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        player_name = player[:player_name]
      end 
    end
  end
  player_name
end

def winning_team 
  winning_team = ''
  away_points = 0 
  home_points = 0 
  game_hash[:away][:players].each do |player|
    away_points += player[:points]
  end 
  game_hash[:home][:players].each do |player|
    home_points += player[:points]
  end 
  if away_points > home_points
    return 'Charlotte Hornets'
  else 
    return 'Brooklyn Nets'
  end 
end 
  
def player_with_longest_name 
  count = 0 
  longest_name = '' 
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:player_name].length > count 
        count = player[:player_name].length 
        longest_name = player[:player_name]
      end 
    end   
  end   
  longest_name
end

def long_name_steals_a_ton?
  count = 0 
  longest_name = '' 
  most_steals = 0 
  most_steal_player = ''
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:player_name].length > count 
        count = player[:player_name].length 
        longest_name = player[:player_name]
      end 
      if player[:steals] > most_steals
        most_steals = player[:steals]
        most_steal_player = player[:player_name]
      end 
      if longest_name == most_steal_player 
        return true 
      else 
        return false 
      end
    end   
  end
end 






  
