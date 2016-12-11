# _Hair Salon Application_

#### _An application for a hair salon, December 9th, 2016_

#### By _**James Lee**_

## Description

_The application for a hair salon that the stylists at the salon work independently, so each client will only belong to a single stylist (one stylist, many clients)._

The following user stories should be completed:

* As a salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

## Setup/Installation Requirements

Clone from Github:
```
 $ git clone https://github.com/babun52/Hair-Salon
 $ cd Hair-Salon
 $ bundle
 $ ruby app.rb
```

In PSQL:
```
CREATE DATABASE hair_salon;_
\c hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```
Browse localhost:4567 in your web browser

## Support and contact details

_Github: https://github.com/babun52_
_Email: babun5209@gmail.com_

## Technologies Used

_Ruby, Sinatra, SQL, Postgres, Bootstrap_

### License

*MIT License*

Copyright (c) 2016 **_James Lee_**
