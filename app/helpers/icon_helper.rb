module IconHelper
  def icon_tag(league)
    if league.sport == "Arm Wrestling"
      image_tag "pingpong-image.png"
    elsif league.sport == "Beer Pong"
      image_tag "beerpong.png"
    elsif league.sport == "Billiard"
      image_tag "snooker.png"
    elsif league.sport == "Boxing"
      image_tag "fight.png"
    elsif league.sport == "Coding"
      image_tag "fight.png"
    elsif league.sport == "Darts"
      image_tag "darts.png"
    elsif league.sport == "Foosball"
      image_tag "foosball.png"
    elsif league.sport == "Karaoke"
      image_tag "karaoke_whitebg.png"
    elsif league.sport == "Marbles"
      image_tag "karaoke.png"
    elsif league.sport == "Ping Pong"
      image_tag "pingpong-image.png"
    elsif league.sport == "Tennis"
      image_tag "tennis.png"
    elsif league.sport == "Weightlift"
      image_tag "weightlift.png"
    end
  end
end
