# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts " --- Deleting all Integrations --- "

Integration.destroy_all

Integration.create!(field_number: 1, name: "Thanksgiving Kids Songs", integration_url: "https://open.spotify.com/artist/3VONALbDHmPgtnW0iperCD")
Integration.create!(field_number: 1, name: "Ultimate 100 Kids songs", integration_url: "https://open.spotify.com/album/3iLA72dHYLr1bn2MHxmKaP")
Integration.create!(field_number: 2, name: "Coyote & Rodrunner Hall of Fame", integration_url: "https://www.youtube.com/watch?v=vFkqmxtB_8U&list=PLmJzZsUhj6P3qT1X9daZvHQs-4Ng2pFQq")
Integration.create!(field_number: 2, name: "Looney Tunes cartoons", integration_url: "https://www.youtube.com/watch?v=xFdG8lZ4PJw&list=PLZs0gQed9tMTqa7R4x3jVr0V-9RaKlpBD")
Integration.create!(field_number: 3, name: "Angry Birds", integration_url: "http://games.mi9.com/play_angry-birds-beat-all-the-bad-pigs/")
Integration.create!(field_number: 3, name: "Candy Crush", integration_url: "https://king.com/fr/#!/play/candycrush")
Integration.create!(field_number: 6, name: "Tiny Titans", integration_url: "http://www.dckids.com/dcnation/comic/id/42")
Integration.create!(field_number: 6, name: "Batman", integration_url: "http://www.dckids.com/dcnation/comic/id/43")
Integration.create!(field_number: 7, name: "Code.org", integration_url: "https://studio.code.org/s/course1/stage/3/puzzle/1")
Integration.create!(field_number: 7, name: "Duolingo", integration_url: "https://www.duolingo.com/welcome")
