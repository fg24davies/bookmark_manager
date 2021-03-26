# Week 4 Afternoon Challenge: Bookmark Manager

## Creating User Stories
```
As a user
So that I can see all my bookmarks 
I want the page to show list of all my bookmarks
```

Updated domain model picture to include MVC, variable and method names

![image](https://user-images.githubusercontent.com/30720508/112221064-e55e4480-8c1e-11eb-9f9f-3ee18b316557.png)


Add bookmarks feature:
``` 
As a user
So that I can easily access websites for later use
I would like to save a bookmark 
```

Delete bookmarks feature:
``` 
As a user
So that I can remove websites I no longer use from my bookmarks
I would like to delete a bookmark
```
Update bookmarks feature:

```
As a user
So that I can make changes to bookmarks
I would like to update a bookmark
```


Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users manage their bookmarks




## Setting up the database

- Install Postgresql with Homebrew `brew install postgresql
- Connect to `psql` (set up admin database to start)
- Create the `bookmark_manager` database using `psql` command `\c bookmark_markmanager;` (don't forget semi colon!)
- For table set up refer to db/migrations/01_create_bookmarks_table.sql (containg the query)

## Setting up the testing database

- Connect to `psql` 
- Create `bookmark_manager_test` database using `psql` command `\c bookmark_markmanager;` (don't forget semi colon!)
- Create table in `psql` using the command in db/migrations/01_create_bookmarks_table.sql as done in the setup of the real database

