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



## System Dependencies

Before running the project, make sure the following system packages are installed.

### Ruby
This project requires:

Ruby 3.0.0

Recommended installation using rbenv:

```

rbenv install 3.0.0
rbenv global 3.0.0

```

Verify:

```

ruby -v

```

---

### Node.js and Yarn
Webpacker requires Node and Yarn.

Install:

```

sudo apt install nodejs
sudo apt install yarn

```

Verify:

```

node -v
yarn -v

```

---

### ImageMagick (required for image uploads)

This project uses **CarrierWave + MiniMagick** to process uploaded images.

MiniMagick requires the **ImageMagick system package**.

Install:

```

sudo apt install imagemagick

```

Verify installation:

```

which convert
convert -version

```

If ImageMagick is missing, image uploads will fail with the error:

```

Failed to manipulate with MiniMagick
executable not found: "convert"

```

---

## Project Setup

Clone the project and install dependencies:

```

bundle install
yarn install

```

Create and migrate the database:

```

DISABLE_SPRING=1 bin/rails db:create
DISABLE_SPRING=1 bin/rails db:migrate

```

(Optional) Seed the database:

```

DISABLE_SPRING=1 bin/rails db:seed

```

Run the server:

```

DISABLE_SPRING=1 bin/rails s

```

Open:

```

[http://127.0.0.1:3000](http://127.0.0.1:3000)

```

