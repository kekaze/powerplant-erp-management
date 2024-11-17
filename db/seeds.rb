# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

WorkOrder.destroy_all
User.destroy_all
Equipment.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('work_orders')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
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
    "unit_name": "Engine",
    "identifier": "Alpha",
  },
  {
    "unit_name": "Engine",
    "identifier": "Bravo",
  },
  {
    "unit_name": "Engine",
    "identifier": "Charlie",
  },
  {
    "unit_name": "Engine",
    "identifier": "Delta",
  },
  {
    "unit_name": "Generator",
    "identifier": "Alpha",
  },
  {
    "unit_name": "Generator",
    "identifier": "Bravo",
  },
  {
    "unit_name": "Oil Purifier",
    "identifier": "Charlie",
  },
  {
    "unit_name": "Oil Purifier",
    "identifier": "Delta",
  },
  {
    "unit_name": "Booster Unit",
    "identifier": "Alpha",
  },
  {
    "unit_name": "Booster Unit",
    "identifier": "Bravo",
  },
]

initial_workorders_data =[
  {
    "wor_number": 120000001,
    "status": "For approval",
    "inspected_at": DateTime.new(2024, 11, 8, 14, 30, 0),
    "priority": "Low",
    "running_hours": 9452,
    "description": "Unusual sound",
    "equipment_id": 1,
    "requestor_id": 1,
    "reviewer_id": 3,
    "approver_id": nil,
    "closer_id": nil,
    "created_at": DateTime.new(2024, 11, 8, 14, 32, 0),
    "reviewed_at": DateTime.new(2024, 11, 8, 14, 35, 0),
    "approved_at": nil,
    "closed_at": nil,
    "sc_requestor": nil,
    "sc_reviewer": nil,
    "sc_approver": nil,
    "sc_closer": nil,
  },
  {
    "wor_number": 120000002,
    "status": "Under review",
    "inspected_at": DateTime.new(2024, 11, 8, 15, 00, 0),
    "priority": "High",
    "running_hours": 9604,
    "description": "Excessive oil leakage near cylinder A3",
    "equipment_id": 2,
    "requestor_id": 2,
    "reviewer_id": nil,
    "approver_id": nil,
    "closer_id": nil,
    "created_at": DateTime.new(2024, 11, 8, 16, 00, 0),
    "reviewed_at": nil,
    "approved_at": nil,
    "closed_at": nil,
    "sc_requestor": nil,
    "sc_reviewer": nil,
    "sc_approver": nil,
    "sc_closer": nil
  },
  {
    "wor_number": 120000003,
    "status": "Draft",
    "inspected_at": DateTime.new(2024, 11, 9, 8, 45, 0),
    "priority": "Low",
    "running_hours": 10347,
    "description": "Oil leak",
    "equipment_id": 7,
    "requestor_id": 1,
    "reviewer_id": nil,
    "approver_id": nil,
    "closer_id": nil,
    "created_at": DateTime.new(2024, 11, 9, 8, 50, 0),
    "reviewed_at": nil,
    "approved_at": nil,
    "closed_at": nil,
    "sc_requestor": nil,
    "sc_reviewer": nil,
    "sc_approver": nil,
    "sc_closer": nil,
  },
  {
    "wor_number": 120000004,
    "status": "Closed",
    "inspected_at": DateTime.new(2024, 11, 10, 12, 22, 0),
    "priority": "High",
    "running_hours": 9604,
    "description": "Excessive fuel leak. Caused engine stoppage.",
    "equipment_id": 10,
    "requestor_id": 2,
    "reviewer_id": 4,
    "approver_id": 5,
    "closer_id": 8,
    "created_at": DateTime.new(2024, 11, 10, 12, 28, 0),
    "reviewed_at": DateTime.new(2024, 11, 10, 12, 35, 0),
    "approved_at": DateTime.new(2024, 11, 10, 12, 36, 0),
    "closed_at": DateTime.new(2024, 11, 10, 16, 55, 0),
    "sc_requestor": nil,
    "sc_reviewer": nil,
    "sc_approver": nil,
    "sc_closer": nil,
  },
  {
    "wor_number": 120000005,
    "status": "For approval",
    "inspected_at": DateTime.new(2024, 11, 13, 9, 30, 0),
    "priority": "Medium",
    "running_hours": 9452,
    "description": "Unusual sound",
    "equipment_id": 5,
    "requestor_id": 2,
    "reviewer_id": 4,
    "approver_id": nil,
    "closer_id": nil,
    "created_at": DateTime.new(2024, 11, 13, 9, 32, 0),
    "reviewed_at": DateTime.new(2024, 11, 13, 9, 35, 0),
    "approved_at": nil,
    "closed_at": nil,
    "sc_requestor": nil,
    "sc_reviewer": nil,
    "sc_approver": nil,
    "sc_closer": nil,
  },
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