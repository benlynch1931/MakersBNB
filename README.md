# MakersBNB

## How to Setup

### Setting up Testing Environment Database:
1. change directories into this project folder.
2. run `psql postgres`.
3. run: `# CREATE DATABASE makers_bnb_manager_test;`
4. exit psql via: `\q`.
5. In the terminal, run:
`psql makers_bnb_manager_test -f ./db/migrations/01_create_test_db.sql`

### Setting up Development Environment Database:
1. change directories into this project folder.
2. run `psql postgres`.
3. run: `# CREATE DATABASE makers_bnb_manager;`
4. exit psql via: `\q`.
5. In the terminal, run:
`psql makers_bnb_manager -f ./db/migrations/02_create_development_db.sql`

## How to Run


## User Stories

- Any signed-up user can list a new space

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

LINE20: Ben's edit


LINE 23 MAIARA R.

Line 25: David's edit
