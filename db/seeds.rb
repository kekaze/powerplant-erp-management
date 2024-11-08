# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
WorkOrder.destroy_all
Equipment.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('work_orders')
ActiveRecord::Base.connection.reset_pk_sequence!('equipment')

initial_users_data =[
  {
    "last_name": "Dela Cruz",
    "first_name": "Juan",
    "role_id": 1,
    "email": "juan@saprevamped.com",
    "password": "$ecretP@ss1",
    "password_confirmation": "$ecretP@ss1",
    "status": 1
  },
  {
    "last_name": "Delos Reyes",
    "first_name": "Maria",
    "role_id": 1,
    "email": "maria@saprevamped.com",
    "password": "$ecretP@ss2",
    "password_confirmation": "$ecretP@ss2",
    "status": 1
  },
  {
    "last_name": "Gomez",
    "first_name": "Carlos",
    "role_id": 2,
    "email": "carlos@saprevamped.com",
    "password": "$ecretP@ss3",
    "password_confirmation": "$ecretP@ss3",
    "status": 1
  },
  {
    "last_name": "Gomer",
    "first_name": "Lucia",
    "role_id": 2,
    "email": "lucia@saprevamped.com",
    "password": "$ecretP@ss4",
    "password_confirmation": "$ecretP@ss4",
    "status": 1
  },
  {
    "last_name": "Smith",
    "first_name": "John",
    "role_id": 3,
    "email": "john.smith@saprevamped.com",
    "password": "$ecretP@ss5",
    "password_confirmation": "$ecretP@ss5",
    "status": 1
  },
  {
    "last_name": "Smithson",
    "first_name": "Emma",
    "role_id": 3,
    "email": "emma.smithson@saprevamped.com",
    "password": "$ecretP@ss6",
    "password_confirmation": "$ecretP@ss6",
    "status": 1
  },
  {
    "last_name": "Johnson",
    "first_name": "Michael",
    "role_id": 4,
    "email": "michael.johnson@saprevamped.com",
    "password": "$ecretP@ss7",
    "password_confirmation": "$ecretP@ss7",
    "status": 1
  },
  {
    "last_name": "Johnston",
    "first_name": "Sophia",
    "role_id": 4,
    "email": "sophia.johnston@saprevamped.com",
    "password": "$ecretP@ss8",
    "password_confirmation": "$ecretP@ss8",
    "status": 1
  },
  {
    "last_name": "Martinez",
    "first_name": "David",
    "role_id": 5,
    "email": "david.martinez@saprevamped.com",
    "password": "$ecretP@ss9",
    "password_confirmation": "$ecretP@ss9",
    "status": 1
  },
  {
    "last_name": "Martinezson",
    "first_name": "Isabella",
    "role_id": 5,
    "email": "isabella@saprevamped.com",
    "password": "$ecretP@ss10",
    "password_confirmation": "$ecretP@ss10",
    "status": 1
  },
  {
    "last_name": "Lopez",
    "first_name": "Daniel",
    "role_id": 6,
    "email": "daniel.lopez@saprevamped.com",
    "password": "$ecretP@ss11",
    "password_confirmation": "$ecretP@ss11",
    "status": 1
  },
  {
    "last_name": "Lopes",
    "first_name": "Olivia",
    "role_id": 6,
    "email": "olivia.lopes@saprevamped.com",
    "password": "$ecretP@ss12",
    "password_confirmation": "$ecretP@ss12",
    "status": 1
  },
  {
    "last_name": "Wang",
    "first_name": "Kevin",
    "role_id": 9,
    "email": "kevin.wang@saprevamped.com",
    "password": "$ecretP@ss13",
    "password_confirmation": "$ecretP@ss13",
    "status": 1
  },
  {
    "last_name": "Wangson",
    "first_name": "Mia",
    "role_id": 9,
    "email": "mia.wangson@saprevamped.com",
    "password": "$ecretP@ss14",
    "password_confirmation": "$ecretP@ss14",
    "status": 1
  }
]

initial_equipment_data = [
  {
    "unit_name": "Engine 1",
    "identifier": "Main Engine",
  },
  {
    "unit_name": "Engine 2",
    "identifier": "Main Engine",
  },
  {
    "unit_name": "Engine 3",
    "identifier": "Main Engine",
  },
  {
    "unit_name": "Engine 4",
    "identifier": "Main Engine",
  },
  {
    "unit_name": "Engine 5",
    "identifier": "Main Engine",
  },
  {
    "unit_name": "Air Compressor 1",
    "identifier": "Starting Air Compressor",
  },
  {
    "unit_name": "Air Compressor 2",
    "identifier": "Starting Air Compressor",
  },
  {
    "unit_name": "Booster Pump 1",
    "identifier": "Booster Pump",
  },
  {
    "unit_name": "Booster Pump 2",
    "identifier": "Booster Pump",
  },
  {
    "unit_name": "Booster Pump 3",
    "identifier": "Booster Pump",
  },
]

initial_workorders_data =[
  {
    "wor_number": 120000001,
    "status": "For approval",
    "inspected_at": DateTime.new(2024, 11, 8, 14, 30, 0),
    "priority": "Low",
    "running_hours": 9452,
    "description": "Engine 1 has unusual sound",
    "equipment_id": 1,
    "requestor_id": 1,
    "reviewer_id": 3,
    "approver_id": nil,
    "closer_id": nil,
    "reviewed_at": DateTime.new(2024, 11, 8, 14, 35, 0),
    "approved_at": nil,
    "closed_at": nil,
  }
]

initial_users_data.each do |user|
  User.create!(user)
end

initial_equipment_data.each do |equipment|
  Equipment.create!(equipment)
end

initial_workorders_data.each do |work_order|
  WorkOrder.create!(work_order)
end