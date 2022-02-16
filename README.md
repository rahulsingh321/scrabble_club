# scrabble_club

## Description

This is sample application of a scrabble game. It includes the players the informations, games informations and their performance on the matches.

It generates the leader boards for the top 10 performing players.

All recorded scrabble games are head to head matches between 2 players, the player with the highest score at the end of the game wins.


## Requirements

This application currently works with:

* Ruby 3.1
* Rails 6.1.x
* PostgreSQL

If you need help setting up a Ruby development environment, check out these [Rails OS X Setup Guide](https://mattbrictson.com/rails-osx-setup-guide).

## Installation

To make this run on your system, follow below steps:

1.  Clone the repository
```
git clone git@github.com:rahulsingh321/scrabble_club.git
```
2. Check your Ruby version
```
ruby -v
```
The ouput should start with something like ruby `3.1` If not, install the right ruby version using `rvm` (it could take a while)

3. Install dependencies
```
bundle install
```
4. Initialize the database

Note: Rename the `database.example.yml -> database.yml` and add the required username/password of postgreSQL if needed.

```
rails db:create db:migrate db:seed
```
5. run application
```
rails s
```

## What does it do?

The application will perform the following steps:

1. Ability to create new players
2. Ability to add new games
3. Ability to create matches( rounds ) for the game with 1-1 players.
4. Generate leader board based on score

## What is included?

* Database schema definition (create table statements) of demo
* A member’s profile screen showing their
  * number of wins
  * number of losses
  * their average score
  * their highest score, when and where it was scored, and against whom
* Interfaces to create and edit members’ details, such as name, phone etc.
* A leader board screen to list the members with the top 10 average scores, for those members who have played at least 10 matches.

## Database Schema

Database tables used as below

* Games schema

```sql
  create_table 'games', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
```

* Matches schema for game and winner player

```sql
  create_table 'matches', force: :cascade do |t|
    t.string 'name'
    t.bigint 'game_id'
    t.integer 'winner_player_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['game_id'], name: 'index_matches_on_game_id'
  end
```

* Participants schema for a match of a game

```sql
  create_table 'participants', force: :cascade do |t|
    t.decimal 'score', precision: 5, scale: 2
    t.bigint 'game_id'
    t.bigint 'player_id'
    t.bigint 'match_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['game_id'], name: 'index_participants_on_game_id'
    t.index ['match_id'], name: 'index_participants_on_match_id'
    t.index ['player_id'], name: 'index_participants_on_player_id'
  end
```

* Players schema

```sql
  create_table 'players', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'nick_name'
    t.string 'email'
    t.string 'phone'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
```
