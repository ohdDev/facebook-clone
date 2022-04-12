# Facebook-clone

## overview
Social media site for content sharing.
documentation of project is [here](https://docs.google.com/document/d/1-0p4h-Ryr3gl7qDEYxC_bpzdqOYb1ORD/edit?usp=sharing&ouid=104580489236968568319&rtpof=true&sd=true)

## app features:
- Sign up - Sign in
Allow to users to create new accounts.

- Posting
Users can publish a post with literal content and/or images.

- Comments
Users can reply to posts using comments where they mention the post author, who by his turn gets a new notification.

- Feedback
Users can show feedback either on post or comments using like button.

- Notification
Users get notified for any new mentions.

- Friend list
User can add new friend by sending friend request. Also he can remove and block any of his friends. 

- roups
User can create a group of his friends.

- Events
User can view friends events, create event, specifying the event name, date, description, privacy.
 
- Internationalization
User can select language for buttons, titles and other facebook-clone text: arabic - english

- Profile Privacy 
User can adjust profile privacy settings to specify what personal info to show and its visibility range (who can view it)


## Getting started (to run a local copy)

### System dependencies:
- Ruby version: 3.0.0
- Rails version: 7.0.2
- Bundler version: 2.3.11

To get started with the app, clone the repo and then install the needed gems:

```bash
bundle install
```

Next, migrate the database:
```bash
rails db:migrate
```

Finally run the app in a local server:

```bash
rails server
```

to run Rspec test
```bash
rspec
```


## Authors

- [ohdDev](https://github.com/ohdDev)
- [majeedDev](https://github.com/majeedDev)
- [Ahlam001](https://github.com/Ahlam001)
- [0xAlmaha](https://github.com/0xAlmaha)
