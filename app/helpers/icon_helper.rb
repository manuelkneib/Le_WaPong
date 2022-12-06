module IconHelper
  def icon_tag(league)
     if league.sport == "Ping-Pong"
      image_tag "pingpong-image.png"
     elsif league.sport == "BeerPong"
      image_tag "beerpong.png"
     elsif league.sport == "Darts"
      image_tag "darts.png"
     elsif league.sport == "Snooker"
        image_tag "snooker.png"
     elsif league.sport == "Tennis"
        image_tag "tenis.png"
     elsif league.sport == "Weightlift"
      image_tag "weightlift.png"
     elsif league.sport == "Fight"
        image_tag "fight.png"
     elsif league.sport == "Foosball"
      image_tag "foosball.png"
     elsif league.sport == "Bowling"
        image_tag "bowling.png"
     else league.sport == "Karaoke"
        image_tag "karaoke.png"
     end
  end
end
