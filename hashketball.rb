# Write your code here!
require 'pry'
def game_hash
  {
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
       {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 

        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
         {
         :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists =>6 ,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5

        },
         {
         :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1

        }
        ]
    },
    :away =>{
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
         {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
         {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
         {
         :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0

        },
         {
         :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
        ]
    }
  }
  
end

def num_points_scored(name)
 game_hash.each do |team,value1|
 value1.each do |attributes,value2|
   if attributes == :players
     value2.each do |player|
       if player[:player_name] == name
         return player[:points]
     end
   end
 end
 end
 end
end

def shoe_size(name)
game_hash.each do |team,value1|
 value1.each do |attributes,value2|
   if attributes == :players
     value2.each do |player|
       if player[:player_name] == name
         return player[:shoe]
     end
   end
 end
 end
 end
end 

def team_colors(name)
  game_hash.each do |key,value|
  if value[:team_name] == name
    return value[:colors]
    end
  end
end

def team_names
team_names = []
game_hash.each {|key,value|
  team_names.push(value[:team_name])
}

team_names
end

def player_numbers(name)
  nums =[]
  game_hash.each { |key,value|
   if value[:team_name] == name
   value.each {|key2,value2|
     if key2 == :players
       value2.each { |player|
       nums.push(player[:number])
       }
     end
   }
   end
  }
  nums

end

def player_stats(name)
#define variable first
stats={}
game_hash.each{|key,value|
  value.each {|key2,value2|
    if key2 == :players
      value2.each {|player|
        if player[:player_name] == name
        stats = player.delete_if{|k,v|
        k == :player_name
        }
        end
      }
    end
  }
}
stats
end

def big_shoe_rebounds
  #return the person's number of rebounds
  rebounds = 0 
  biggest_size = 0
  game_hash.each {|key,value|
  value.each {|key2,value2|
   if key2 == :players
   
    biggest_size = value2[0][:shoe]
    i = 1
   while i< value2.length do
   if value2[i][:shoe]>biggest_size
     biggest_size = value2[i][:shoe]
     rebounds = value2[i][:rebounds]
   end
    i += 1
   end
   end    
  }
    
  }
  rebounds
end 

def most_points_scored
  name = 0 
  most_points = 0
  game_hash.each {|key,value|
  value.each {|key2,value2|
   if key2 == :players
   
    most_points = value2[0][:points]
    i = 1
   while i< value2.length do
   if value2[i][:points]>most_points
     most_points = value2[i][:points]
     name = value2[i][:player_name]
   end
    i += 1
   end
   end    }
    
  }
  name
end
def winning_team
  team = {}
  team_name = ""
  
   game_hash.each {|key,value|
   team[value[:team_name]] = 0
  
   value.each {|key2,value2|
   if key2 == :players
    i = 0
    total = 0 
   while i< value2.length do
    total += value2[i][:points]
    i += 1
   end
   team[value[:team_name]] = total
   end    
  }
    
  }
  #how to return team name without type out the team names in the method?
  #how to compare the data?
  if team["Brooklyn Nets"] > team["Charlotte Hornets"]
    team_name = "Brooklyn Nets"
  else
    team_name = "Charlotte Hornets"
  end
  return team_name
  
end

def player_with_longest_name
  namelength = 0 
  name = ""
  
  game_hash.each {|key,value|
  value.each {|key2,value2|
  if key2 == :players
  i = 0
   while i< value2.length do
   if value2[i][:player_name].length > namelength
     name = value2[i][:player_name]
     namelength = value2[i][:player_name].length
   end
    i += 1
   end
   end   
   }
  }
  name
  
end
def long_name_steals_a_ton?
  long_name = player_with_longest_name
  highest_steals = 0
  highest_steals_name = ""
   game_hash.each {|key,value|
  value.each {|key2,value2|
  if key2 == :players
   i = 0
   while i< value2.length do
   if value2[i][:steals] > highest_steals
   highest_steals_name = value2[i][:player_name]
   highest_steals = value2[i][:steals]
   end
    i += 1
   end
   end   
   }
  }
  long_name == highest_steals_name
end










