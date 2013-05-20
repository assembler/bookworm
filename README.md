# README

## Populating database with sample data

* `rake fakeout:small` - 20% of medium sample
* `rake fakeout:medium` - 50 users, 1000 books
* `rake fakeout:large` - 5x medium sample

_Note: running this task will clear out the database first_

## Creating admin account

* `rake user:create_admin`
