# Power Plant Management System

This project is inspired by SAP S/4HANA that is used for enterprise resource planning (ERP).



## Requirements
Make sure you have installed the following:
* Ruby 3.2.3 ([Installation Guide](https://guides.rubyonrails.org/getting_started.html))
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
2. Navigate to the local project directory
3. Install the latest bundler gem
   ```
   gem install bundler
   ```
4. Install the project's dependencies
   ```
   bundle install
   ```

## Database Initialization
1. Database configuration:
   <p>Go to <code>config/database.yml</code></p>

2. Create db, load schema, and seed the database:
   ```
   rails db:setup
   ```

## Run the project
  ```
  rails server
  ```
