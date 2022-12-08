module IconHelper
  def icon_tag(league)
    if league.sport == "Arm Wrestling"
      image_tag "armwrestling_white.png"
    elsif league.sport == "Beer Pong"
      image_tag "beerpong_white.png"
    elsif league.sport == "Billiard"
      image_tag "snooker_white.png"
    elsif league.sport == "Boxing"
      image_tag "fight_white.png"
    elsif league.sport == "Coding"
      image_tag "coding_white.png"
    elsif league.sport == "Darts"
      image_tag "darts_white.png"
    elsif league.sport == "Foosball"
      image_tag "foosball_white.png"
    elsif league.sport == "Karaoke"
      image_tag "karaoke_white.png"
    elsif league.sport == "Marbles"
      image_tag "marbles_white.png"
    elsif league.sport == "Ping Pong"
      image_tag "pingpong_white.png"
    elsif league.sport == "Tennis"
      image_tag "tennis_white.png"
    elsif league.sport == "Weightlift"
      image_tag "weightlift_white.png"
    end
  end
end
