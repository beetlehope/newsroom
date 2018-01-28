# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: "editor@newsroom.com")
	User.create!(email: "editor@newsroom.com", password: "password", editor: true)
end	

#["Obama did this", "Trump did that"].each do |name|
#	Idea.create!(name: name, description: "A sample article idea about #{name}")
#end	


unless State.exists?
	State.create(name: "Research", color: "#0066CC")
	State.create(name: "Writing", color: "#008000")
	State.create(name: "Editing", color: "#990000")
	State.create(name: "Done", color: "#663399")
end	