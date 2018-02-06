# Newsroom App

This app can be used for project management by an editorial team. Members of the team can log in and pitch their ideas for news stories. Editors can add and archive team members.

The app is live on [*Heroku*](https://newsroom-app.herokuapp.com/). You can log in with editor credentials:

email: editor@newsroom.com, password: password

## Getting started

To get started with the app, clone this repo and install the gems:

```
$ bundle install
```

Next, migrate the database and seed the data:

```
$ rails db:migrate
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```

If the test suite passes, you'll be able to run the app in a local server:

```
$ rails server
```

## Built With
* Rails ~> 5.1.4
* RSpec 3.7.2

## Acknowledgements

The app was inspired by Ryan Bigg's [*"Rails 4 in Action"*](https://www.manning.com/books/rails-4-in-action) book. Many of the ideas and principles from the book were used and adapted for my app, as well parts of CSS. 

