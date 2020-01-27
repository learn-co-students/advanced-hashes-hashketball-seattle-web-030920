# Write your code here!
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        return player[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  team_names = []
  game_hash.reduce({}) do |memo, (key, team)|
    team_names << team[:team_name]
    memo
  end
  team_names
end

def player_numbers(team_name)
  jerseys = []
  game_hash.reduce({}) do |memo, (key, team)|
    if team[:team_name] == team_name
      team[:players].each do |player|
        jerseys << player[:number]
      end
    end
    memo
  end
  jerseys
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        player.each do |player_key, player_value|
          stats[player_key] = player_value
        end
      end
    end
  end
  stats.delete(:player_name)
  stats
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  player_name = ""
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:points] > points
        points = player[:points]
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def winning_team
  team_points = 0
  team_name = ""
  game_hash.each do |key, team|
    team_total = 0
    team[:players].each do |player|
      team_total += player[:points]
    end
    if team_total > team_points
      team_points = team_total
      team_name = team[:team_name]
    end
  end
  team_name
end

def player_with_longest_name
  player_name = ""
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:player_name].length > player_name.length
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  player_name = player_with_longest_name
  player_steals = 0
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        player_steals = player[:steals]
      end
    end
  end
  game_hash.each do |key, team|
    team[:players].each do |player|
      if player[:steals] > player_steals
        return false
      end
    end
  end
  true
end
