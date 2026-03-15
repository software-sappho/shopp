# Shop Project – Development Documentation

This document records the environment setup process, debugging steps, and fixes applied while preparing the project to run successfully.

---

## 1. Ruby Environment Setup

- Installed Ruby 3.0.0 using rbenv.
- Set Ruby 3.0.0 as the global version.
- Verified installation using:

```bash
ruby -v
````

Ruby version in use:

```
ruby 3.0.0p0
```

---

## 2. Dependency Installation

### Initial Issues

* Outdated `Gemfile.lock`
* Missing gem dependencies
* mimemagic version conflicts

### Resolution

* Removed `Gemfile.lock`
* Re-ran:

```bash
bundle install
```

* Installed updated compatible gem versions.

---

## 3. mimemagic Compatibility Issue

### Problem

CarrierWave (v2.2.0) required:

```
require "mimemagic/overlay"
```

However, the installed mimemagic gem (v0.4.3) no longer included `overlay.rb`.

This caused:

```
LoadError: cannot load such file -- mimemagic/overlay
```

### Solution

Created a compatibility shim:

```
mimemagic/overlay.rb
```

The shim:

* Detects the existing `MimeMagic` class
* Safely adds required methods without redefining the constant
* Uses `marcel` internally for MIME detection
* Prevents constant redefinition errors

---

## 4. Logger NameError During Boot

### Error

```
uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger
```

### Cause

The `Logger` class was not explicitly required early enough in the boot process.

### Fix

Added:

```ruby
require "logger"
```

To:

* `config/boot.rb`
* `config/application.rb`

This ensured Logger was loaded before Rails/ActiveSupport initialization.

---

## 5. Spring Boot Conflicts

Spring caching caused inconsistent boot behavior and confusing errors.

### Resolution

Disabled Spring for development commands:

```bash
DISABLE_SPRING=1 bin/rails s
DISABLE_SPRING=1 bin/rails db:migrate
```

This prevents stale boot caches from interfering.

---

## 6. Database Seed Error

### Error

```
ActiveRecord::RecordInvalid: Email has already been taken
```

### Cause

Seed data attempted to insert duplicate records.

### Fix

Reset the development database:

```bash
bin/rails db:drop db:create db:migrate db:seed
```

---

## 7. Webpacker Verification

Webpacker confirmed operational:

```
[Webpacker] Everything's up-to-date. Nothing to do
```

The products index page renders successfully.

---

## 8. Current Application Status

* Rails 6.1.7.10 operational
* Puma server running
* Database migrations successful
* Dev environment stable
* ProductsController#index renders correctly
* No critical boot errors remaining

---

## 9. Future Improvements

* Upgrade Ruby to a supported version
* Upgrade CarrierWave to remove shim dependency
* Remove Spring workaround once environment is stable
* Document production deployment process
* Add automated test documentation

---

## Summary

The project is now:

* Bootable
* Stable in development
* Fully functional at [http://localhost:3000](http://localhost:3000)

All major environment and dependency issues have been resolved.

```

