# Shop – Rails E-Commerce Application

## Overview

This project is a Ruby on Rails 6.1 application.

Stack used:

- Ruby 3.0.0  
- Rails 6.1.7.10  
- SQLite3 (development)  
- Webpacker  
- Devise (authentication)  
- CarrierWave (image uploads)

---

## Requirements

Make sure you have installed:

- Ruby 3.0.0 (recommended via rbenv)
- Bundler
- Node.js
- Yarn
- SQLite3

Check your versions:

```bash
ruby -v
bundle -v
rails -v
node -v
yarn -v
````

---

## Installation

Clone the repository and enter the project directory:

```bash
git clone <repository-url>
cd shop
```

Install Ruby and JavaScript dependencies:

```bash
bundle install
yarn install
```

---

## Database Setup

Create the database:

```bash
DISABLE_SPRING=1 bin/rails db:create
```

Run migrations:

```bash
DISABLE_SPRING=1 bin/rails db:migrate
```

(Optional) Seed the database:

```bash
DISABLE_SPRING=1 bin/rails db:seed
```

If you encounter duplicate seed errors:

```bash
DISABLE_SPRING=1 bin/rails db:drop db:create db:migrate db:seed
```

---

## Running the Application

Start the Rails server:

```bash
DISABLE_SPRING=1 bin/rails s
```

Open your browser and visit:

[http://localhost:3000](http://localhost:3000)

---

## Development Notes

* Spring is disabled during development to avoid boot/cache issues.
* If you encounter unexpected behavior, clear temporary cache:

```bash
rm -rf tmp/cache
```

* Stop the server with:

```
CTRL + C
```

---

## Current Status

* Rails boots successfully
* Database migrations working
* Webpacker functioning
* Products index page loads correctly

```

