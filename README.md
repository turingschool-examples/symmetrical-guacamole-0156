# Hotel It on the Mountain

This repository requires and has been tested on Ruby v2.7.4 and is based on Rails 5.2.8.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork **once the time is up (not before!)**
* The use of scaffolding is not permitted on this assessment. 

## Submission

**Once the time for the assessment is up**, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge
* What story you got through

## Requirements

* TDD all new work
* Model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Challenge Description

You have been contracted by a luxurious mountain ski hotel & resort to keep track of all of the hotels, the rooms of that hotel, and the guests that stay there. 

* Hotels have a name and a location.
  * ex: `name: 'Echo Mountain Inn', location: 'Echo Mountain'`
* Rooms have a rate (price per night), and a suite designation. (For simplicity, let's assume the rate is a whole dollar price and use an integer.)
  * ex: `rate: 125, suite: "Presidential"`
* Guests have a name and the number of nights they'll be staying.
  * ex: `name: 'Charlize Theron', nights: 3`

## Model Setup
* Hotels have many Rooms. 
* Rooms belong to a Hotel.
* Guests have many Rooms.
* Rooms have many Guests.

Some of the initial model set up and testing has been done for you. Make sure your models & relationships are ready before starting user stories. You do not need to test for or create any model validations. 

## User Stories

```
Story 1
Guest Show

As a visitor
When I visit a guest's show page
I see the guest's name
And I see a list of all the rooms they've stayed in
including the room's suite, nightly rate, and the name of the hotel that it belongs to.
```

```
Story 2
Add a Guest to a Room

As a visitor
When I visit a guest's show page
Then I see a form to add a room to this guest.
When I fill in a field with the id of an existing room
And I click submit
Then I am redirected back to the guest's show page
And I see the room now listed under this guest's rooms.
(You do not have to test for a sad path, for example if the ID submitted is not an existing room)
```

```
Story 3
Rooms Index

As a visitor
When I visit the rooms index page
Then I see a list of all rooms
including the room's suite, nightly rate, and the name of the hotel that it belongs to
and the number of guests that have stayed in that room.
```

## Extensions

```
Extension

As a visitor,
When I visit a hotel's show page,
Then I see a unique list of all guests that have stayed at this hotel.
```
