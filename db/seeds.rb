# Create sample users

	editor = User.create!(email: "editor@newsroom.com", password: "password", editor: true, login: "editor")

	bob = User.create!(email: "bob@newsroom.com", password: "password", editor: false, login: "bob")

	kate = User.create!(email: "kate@newsroom.com", password: "password", editor: false, login: "kate")

	steve = User.create!(email: "steve@newsroom.com", password: "password", editor: false, login: "steve")

# Create sample states

	research = State.create(name: "Research", color: "#0066CC")
	writing = State.create(name: "Writing", color: "#008000")
	editing = State.create(name: "Editing", color: "#990000")
	done = State.create(name: "Done", color: "#663399")

	# Create sample ideas

	Idea.create!(name: "Trump want to give citizenship to DREAMERs", description: "Apparently Trump flipped on one of his key election promises: he now wants to provide a road to citizenship to illegals who were brought to the USA by their parents.", state: research, user: editor)
	Idea.create!(name: "Poland will punish those who use the term 'polish death camps'", description: "The Polish Senate approved a bill according to which you can be sentenced to a fine or even a prison sentence for using the term 'polish death camps' instead of 'german death camps'", state: writing, user: bob)
	Idea.create!(name: "Navalny arrested again", description: "Russian opposition leader Alexey Navalny was arrested again during protests against a coming rigged elected", state: editing, user: kate)
	Idea.create!(name: "Ireland announced a referendum on abortion", description: "This may the Irish will vote on lifting the abortion ban, this is the first time in 35 years the voters will have a say on the issue", state: done, user: steve)
