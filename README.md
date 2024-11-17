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
   * <p>Go to <code>config/database.yml</code></p>
   * <p>Configure database credentials in line 12 and 13</p>
   * <p>Edit database names (if needed) on lines 17 and 24</p>

2. Run migrations:
   ```
   rails db:migrate
   ```

3. Seed database:
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
