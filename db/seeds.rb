def random_boolean
  num = rand(2)
  num == 1 ? true : false
end

def random_course
  classes = ["First Aid at Work", "BLS", "Fire Safety", "Food Safety", "Manual Handling"]
  classes[rand(classes.length)]
end

def random_location
  locations = ["Grand Rapids", "Ada", "Lowell", "Walker", "Wyoming", "Grandville", "Standale"]
  locations[rand(locations.length)]
end

# Generate 10 awarded jobs
awarded = ["Harmony", "Founders", "HopCat", "Lantern", "The Sparrows", "Hideout", "Harmony Hall", "Global Infusion", "Brewery Vivant", "Mayan Buzz Cafe"]

awarded.each do |name|
  JobListing.create!(company_name: name,
                     course: random_course,
                     location: random_location,
                     class_date: Date.new(2016, 12, 1),
                     class_time: DateTime.new(2016, 12, 1, 3, 30),
                     number_of_students: 1 + rand(25),
                     rate: 1 + rand(9999) + rand.round(2),
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac diam id diam egestas tempus a sed turpis. Curabitur faucibus mi diam, vel dignissim est elementum laoreet. Nunc aliquam neque nec arcu venenatis faucibus. Mauris eu risus id est cursus pulvinar. In hac habitasse platea dictumst. Sed fringilla, magna vel porta fringilla, neque lectus iaculis dui, eget lacinia erat dui et mauris. Sed vehicula, nibh eu commodo consectetur, felis tortor consectetur magna, ut vestibulum dui enim a neque. Proin vulputate venenatis condimentum. Nullam finibus, nisi at vulputate consequat, justo justo efficitur purus, eget varius nibh turpis sit amet leo. Suspendisse molestie enim iaculis mauris rhoncus egestas at vitae turpis. Fusce ornare venenatis leo a gravida.",
                     needs_equipment: random_boolean,
                     needs_insurance: random_boolean,
                     awarded_application_id: 1 + rand(5),
                     approved: true)
end

# Generate 10 unapproved jobs
unapproved = ["Pickwick", "Johnny B's", "Donkey", "Winchester", "Rowsters", "Furniture City Creamery", "Funky Buddah", "The Sparrows", "Electric Cheetah", "Cherie Inn"]

unapproved.each do |name|
  JobListing.create!(company_name: name,
                     course: random_course,
                     location: random_location,
                     class_date: Date.new(2016, 12, 1),
                     class_time: DateTime.new(2016, 12, 1, 3, 30),
                     number_of_students: 1 + rand(25),
                     rate: 1 + rand(9999) + rand.round(2),
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac diam id diam egestas tempus a sed turpis. Curabitur faucibus mi diam, vel dignissim est elementum laoreet. Nunc aliquam neque nec arcu venenatis faucibus. Mauris eu risus id est cursus pulvinar. In hac habitasse platea dictumst. Sed fringilla, magna vel porta fringilla, neque lectus iaculis dui, eget lacinia erat dui et mauris. Sed vehicula, nibh eu commodo consectetur, felis tortor consectetur magna, ut vestibulum dui enim a neque. Proin vulputate venenatis condimentum. Nullam finibus, nisi at vulputate consequat, justo justo efficitur purus, eget varius nibh turpis sit amet leo. Suspendisse molestie enim iaculis mauris rhoncus egestas at vitae turpis. Fusce ornare venenatis leo a gravida.",
                     needs_equipment: random_boolean,
                     needs_insurance: random_boolean)
end

# Generate 10 available jobs
available = ["Billy's", "Pita House", "Uncle Cheetah's Soup Shop", "Weathy Station", "O'Toole's Pub", "Stella's", "Two Beards Subs", "MadCap", "Creston Brewing", "Tacos El Cuñado"]

available.each do |name|
  JobListing.create!(company_name: name,
                     course: random_course,
                     location: random_location,
                     class_date: Date.new(2016, 12, 1),
                     class_time: DateTime.new(2016, 12, 1, 3, 30),
                     number_of_students: 1 + rand(25),
                     rate: 1 + rand(9999) + rand.round(2),
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac diam id diam egestas tempus a sed turpis. Curabitur faucibus mi diam, vel dignissim est elementum laoreet. Nunc aliquam neque nec arcu venenatis faucibus. Mauris eu risus id est cursus pulvinar. In hac habitasse platea dictumst. Sed fringilla, magna vel porta fringilla, neque lectus iaculis dui, eget lacinia erat dui et mauris. Sed vehicula, nibh eu commodo consectetur, felis tortor consectetur magna, ut vestibulum dui enim a neque. Proin vulputate venenatis condimentum. Nullam finibus, nisi at vulputate consequat, justo justo efficitur purus, eget varius nibh turpis sit amet leo. Suspendisse molestie enim iaculis mauris rhoncus egestas at vitae turpis. Fusce ornare venenatis leo a gravida.",
                     needs_equipment: random_boolean,
                     needs_insurance: random_boolean,
                     approved: true)
end
