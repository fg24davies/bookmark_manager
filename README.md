# Week 4 Afternoon Challenge: Bookmark Manager

## 1. Creating User Stories
```
As a user
So that I can see all my bookmarks 
I want the page to show list of all my bookmarks

```
![image](https://user-images.githubusercontent.com/30720508/112006249-764bf780-8b1b-11eb-9e35-d0ae0d28f0bd.png)


## Setting up the database

- Install Postgresql with Homebrew `brew install postgresql
- Connect to `psql` (set up admin database to start)
- Create the `bookmark_manager` database using `psql` command `\c bookmark_markmanager;` (don't forget semi colon!)
- For table set up refer to db/migrations/01_create_bookmarks_table.sql (containg the query)

## Setting up the testing database

- Connect to `psql` 
- Create `bookmark_manager_test` database using `psql` command `\c bookmark_markmanager;` (don't forget semi colon!)
- Create table in `psql` using the command in db/migrations/01_create_bookmarks_table.sql as done in the setup of the real database

