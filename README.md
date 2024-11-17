# Power Plant Management System

This project is inspired by SAP S/4HANA that is used for enterprise resource planning (ERP).



## Requirements
Make sure you have installed the following:
* Ruby 3.2.x ([Installation Guide](https://rubyinstaller.org/))
* PostgreSQL 16.x ([Installation Guide](https://www.postgresql.org/download/))

## Setup
1. Clone the project:
   <h6>Using SSH: </h6>
   
   ```
   git clone git@github.com:kekaze/powerplant-erp-management.git
   ```
   
   <h6>Using HTTPS:</h6>
   
   ```
   git clone https://github.com/kekaze/powerplant-erp-management.git
   ```
2. Restart you terminal
3. Navigate to the local project directory
4. Install the project's dependencies
   ```
   bundle install
   ```

## Database Initialization
1. Database configuration:
   * <p>Go to <code>config/database.yml</code></p>
   * <p>Configure database credentials in line 12 and 13</p>
   * <p>Edit database names (if needed) on lines 17 and 24</p>

2. Create database:
   ```
   rails db:create
   ```
3. Run migrations:
   ```
   rails db:migrate
   ```

4. Seed database:
   ```
   rails db:seed // runs the db/seed.rb file
   ```

## Run the project
  ```
  rails server
  ```

## System Rules
* Requestors can create new Work Order Requests (WOR)
* Requestors can access their own draft WORs only
* Reviewers can access WORs with status: 'Under review', 'For approval', 'Closed', and 'Rejected'
* Approvers can access WORs with status: 'For approval', 'Closed', and 'Rejected'
* Specialists can access WORs with status: 'For approval', 'Approved', and 'Closed' 
* Admin cannot access WOR pages
* Admin pages cannot be accessed by other roles

## Troubleshoot
* (Windows OS) If you encounter a problem during <code>bundle install</code> pertaining to a missing "yaml.h" file, you have 2 options:
   1. Faster solution: Add to Gemfile: `gem "psych", "~>3.0.0"`. Re-run `bundle install`
   2. Longer solution: Manually install the `libyaml` development package by opening the MSYS2 Terminal (which was installed together with Ruby) and run <code>pacman -S mingw-w64-x86_64-libyaml</code>. Check if it successfully installed the yaml.h file in `/mingw64/include/` directory. Then re-run `bundle install`

* (Windows OS) Upon running `rails server`, it may provide an error saying "Your ExecJS runtime JScript isn't supported by autoprefixer-rails, please switch to Node.js (V8) or mini_racer (V8)":
  1. Faster Solution: Install Nodejs or mini_racer gem file
  2. Longer solution: Try installing the gem: autoprefixer-rails in version 10.4.16.0
