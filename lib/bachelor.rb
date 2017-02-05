def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant_data|
    # goes to correct season and looks at array of all data from each contestant_data
    if contestant_data["status"].downcase == "winner"
      #checks the values under "status" and sees if it equals "winner"
      return contestant_data["name"].split(" ").first
      #returns name of contestant; why does the "return" method need to be added?
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    #iterates across the full hash and splits out season and contestants
    #season => [{"name":, "age":, . . .}]
    contestants.each do |contestant_hash|
        #iterates one level lower with just contestant_hash now
        #{}"name", "age", . . .}
      if contestant_hash["occupation"] == occupation
        #look at the "occupation" key and see if it matches Occupation
        return contestant_hash["name"]
          #if matches, return the value for "name" key
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  home_town_count=0
    #set the counter to 0
  data.each do |season, contestants|
      #iterate across first hash level
    contestants.each do |contestant_hash|
        #iterate across second hash level
      if contestant_hash["hometown"]==hometown
          #if statement to match key"hometown" with hometown argument
        home_town_count+=1
          #if true, add to counter
      end
    end
  end
  home_town_count
  #return the variable
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
    contestants.each do |contestant_hash|
      if contestant_hash["hometown"]==hometown
      return contestant_hash["occupation"]
      end
    end
  end
end


def get_average_age_for_season(data, season)
total_age=0
total_count=0
  data[season].each do |contestant_hash|
    total_age += contestant_hash["age"].to_i
    total_count += 1
  end
  (total_age/total_count.to_f).round(0)
    #to_f creates a floating decimal.  then round helps round it up.
end
