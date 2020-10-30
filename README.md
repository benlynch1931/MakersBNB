# MakersBNB

## How to Setup

### Setting up Testing Environment Database:
1. change directories into this project folder.
2. run `psql postgres`.
3. run: `# CREATE DATABASE makers_bnb_manager_test;`
4. exit psql via: `\q`.
5. In the terminal, run:
`psql makers_bnb_manager_test -f ./db/migrations/01_create_test_db_users.sql`
`psql makers_bnb_manager_test -f ./db/migrations/03_create_test_db.sql`

### Setting up Development Environment Database:
1. change directories into this project folder.
2. run `psql postgres`.
3. run: `# CREATE DATABASE makers_bnb_manager;`
4. exit psql via: `\q`.
5. In the terminal, run:
`psql makers_bnb_manager -f ./db/migrations/02_create_development_db_users.sql`
`psql makers_bnb_manager -f ./db/migrations/04_create_development_db.sql`


## How to Run


## User Stories

- [x] Any signed-up user can list a new space

```
As a user,
So I can view or list spaces,
I want to sign-up to MakersBNB.
```

```
As a provider,
So customers can view my space,
I want to list a new space.
```
- [x] Users can list multiple spaces.
```
As a provider
As I have many spaces
I want to be able to list multiple spaces
```

- [x] Users should be able to name their space, provide a short description of the space, and a price per night.
```
As a provider
So that I can advertise my space
I want to be able to provide a name, description and price per night of my space
```

- [ ] Users should be able to offer a range of dates where their space is available.
```
As a provider
So that customers know when they can book
I want to provide a range of available dates for my spaces
```

- [ ] Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
```
As a user
So that I can rent a space for one night
I want to request to hire a space for a night
```

```
As a provider
So that customers can stay in one of my spaces
I want to confirm their hiring request
```

- [ ] Nights for which a space has already been booked should not be available for users to book that space.
```
As a customer
So I do not book somewhere that is already booked
I want to see that it is unavailable.
```

- [ ] Until a user has confirmed a booking request, that space can still be booked for that night.
```
As a provider
Until I confirm a request
I can continue to receive requests for my space to be rented that night
```
