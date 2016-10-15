# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artist1 = Artist.create({first_name:"Eric",last_name:"Clapton", bio: "Eric Patrick Clapton was born on 30 March 1945 in his grandparents’ home at 1 The Green, Ripley, Surrey, England. He was the son of 16-year-old Patricia Molly Clapton (b. 7 January 1929, d. March 1999) and Edward Walter Fryer (b. 21 March 1920, d. 1985), a 24-year-old Canadian soldier stationed in England during World War II. Before Eric was born, Fryer returned to his wife in Canada." })
artist2 = Artist.create({first_name: "Gary", last_name: "Clark Jr.", bio:"Ever since 2010, when Gary Clark Jr. wowed audiences with electrifying live sets everywhere from the Crossroads Festival to Hollywood’s historic Hotel Café, his modus operandi has remained crystal clear: “I listen to everything…so I want to play everything.” The revelation that is the Austin-born virtuoso guitarist, vocalist and songwriter finds him just as much an amalgamation of his myriad influences and inspirations. Anyone who gravitated towards Clark’s, 2011’s Bright Lights EP, heard both the evolution of rock and roll and a savior of blues. The following year’s full-length debut, Blak And Blu, illuminated Clark’s vast spectrum - “Please Come Home” is reminiscent of Smokey Robinson, while “Ain’t Messin’ Around” recalls Sly and the Family Stone. 2014’s double disc Gary Clark Jr–Live projected Clark into 3D by adding palpable dimension and transcendent power –– songs soared and drifted from the epic, psychedelic-blues of “When My Train Comes In” to his anthemic, hip-hop, rock-crunch calling card, “Bright Lights”, all the way down to the deep, dark, muddy water of “When The Sun Goes Down”."})

song1 = Song.create({title:"Running On Faith", duration: 363000, genre: "Blues", artist: artist1 })
song2 = Song.create({title:"Tears in Heaven", duration: 244000, genre: "Blues", artist: artist1 })
song3 = Song.create({title:"Layla", duration: 244900, genre: "Blues", artist: artist1 })

song4 = Song.create({title:"The Healing", duration: 244900, genre: "Blues, Soul", artist: artist2 })
song5 = Song.create({title:"Church", duration: 301000, genre: "Soul", artist: artist2 })
song6 = Song.create({title:"Can't Sleep", duration: 228000, genre: "Blues", artist: artist2 })
