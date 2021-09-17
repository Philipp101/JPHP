puts "start seed"




event1 = Event.create!(title: "", eventtext: "Magician yes yes yes and yes", links: "S")
event1.photos.attach(io: File.open(Rails.root.join('app/assets/images/tower.png')), filename: 'tower.png', content_type: 'image/png')

event2 = Event.create!(eventtext: "youskekjr", links: "77")

event3

puts "done!"
