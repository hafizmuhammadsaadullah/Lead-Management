# Lead Management

Sales CRM for managing leads and sales processes in an organization. It tracks leads, helps allocate technical resources, and automates commission calculations for sales teams.

## Tech stack

- Ruby 2.6.6 and Rails 5.2.4.4
- PostgreSQL 13
- RSpec for tests, RuboCop for linting

## Getting started

Prerequisites: Ruby 2.6.6, Rails 5.2.4.4 and PostgreSQL 13.

1. Clone the repository

```sh
git clone https://github.com/hafizmuhammadsaadullah/Lead-Management.git
cd Lead-Management
bundle install
```

2. Create `config/database.yml` from the sample file and edit the database configuration as required

```sh
cp config/database.yml.sample config/database.yml
```

3. Create and set up the database

```sh
rails db:setup
rails db:migrate
rails db:seed
```

4. Set the environment variables in `application.yml`

5. Start the Rails server

```sh
rails s
```

Then open http://localhost:3000

## Running the tests

```sh
bundle exec rspec
```
