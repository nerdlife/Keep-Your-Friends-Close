

ryan = User.create(name: "Ryan Urie", email:"ryanurie@yahoo.com", latitude: 37.7845657, longitude: -122.39753189999999, phone_number: "+3103442422")

fp = ryan.groups.create(name: "Final Project Group", user_id: 1)

fp.users.create(name: "Ryan", latitude: 37.788, longitude: -122.3975318999999, phone_number: "+13105551212")
fp.users.create(name: "Ryan M", latitude: 37.783, longitude: -122.397531899999, phone_number: "+13105551212" )
fp.users.create(name: "Ryan McKay", latitude: 37.7853, longitude: -122.39753189999992, phone_number: "+13105551212")



vegas = ryan.groups.create(name: "Portland", description: "Going outfor the night to concert.  Keep in touch guys..", user_id: 1)

vegas.users.create(name: "John Smith", latitude: 36.1215, longitude: -115.1739)

vegas.users.create(name: "Jon Doe", latitude: 36.121, longitude: -115.178)
vegas.users.create(name: "Jane Doe", latitude: 36.131, longitude: -115.168)
